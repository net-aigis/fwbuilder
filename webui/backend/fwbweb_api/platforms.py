"""Parse Firewall Builder platform/OS resource XML for WebUI option schemas."""

from __future__ import annotations

import json
import xml.etree.ElementTree as ET
from functools import lru_cache
from pathlib import Path
from typing import Any

from .settings import settings

_REPO_ROOT = Path(__file__).resolve().parents[3]
_DIALOG_FIELDS_PATH = Path(__file__).resolve().parent / "data" / "dialog_fields.json"

INSTALLER_KEYS = (
    "admUser",
    "altAddress",
    "activationCmd",
    "firewall_dir",
    "output_file",
    "sshArgs",
    "scpArgs",
    "use_scp",
    "script_name_on_firewall",
)

COMMON_KEYS = (
    "prolog_script",
    "epilog_script",
    "prolog_place",
    "check_shading",
    "debug",
)

# Desktop QStackedWidget switch maps (preview / follow-option; not pixel parity).
_IFACE_STACK_SWITCH: dict[str, dict[str, Any]] = {
    "linux24IfaceOptsDialog": {
        "stack": "options_stack",
        "control": "iface_type",
        "by_type": {"ethernet": 0, "8021q": 1, "bridge": 2, "bonding": 3},
        "default": 0,
        "preview_only": True,
        "note": "Desktop typeChanged(); WebUI device-type select is display/preview only.",
    },
    "bsdIfaceOptsDialog": {
        "stack": "options_stack",
        "control": "iface_type",
        "by_type": {"ethernet": 1, "8021q": 2, "bridge": 3},
        "default": 0,
        "preview_only": True,
        "note": "Desktop typeChanged(); empty page 0; ethernet uses index 1.",
    },
    "pixosIfaceOptsDialog": {
        "stack": "options_stack",
        "control": "iface_type",
        "by_type": {"8021q": 1},
        "default": 0,
        "preview_only": True,
        "note": "Desktop VLAN → stack index 1; else 0.",
    },
    "secuwallIfaceOptsDialog": {
        "stack": "options_stack",
        "control": "iface_type",
        "by_type": {"8021q": 1},
        "default": 0,
        "preview_only": True,
        "note": "Desktop VLAN → stack index 1; else 0.",
    },
}

_OPTION_STACK_SWITCH: dict[str, list[dict[str, Any]]] = {
    "iptAdvancedDialog": [
        {
            "stack": "logTargetStack",
            "option": "use_ULOG",
            "when_true": 1,
            "when_false": 0,
            "preview_only": False,
            "note": "Desktop switchLOG_ULOG(); follow use_ULOG option.",
        }
    ],
    "ipcopAdvancedDialog": [
        {
            "stack": "logTargetStack",
            "option": "use_ULOG",
            "when_true": 1,
            "when_false": 0,
            "preview_only": False,
            "note": "Follow use_ULOG like iptAdvancedDialog.",
        }
    ],
    "secuwallAdvancedDialog": [
        {
            "stack": "logTargetStack",
            "option": "use_ULOG",
            "when_true": 1,
            "when_false": 0,
            "preview_only": False,
            "note": "Follow use_ULOG like iptAdvancedDialog.",
        }
    ],
}


def _iface_stack_switch(stem: str | None) -> dict[str, Any] | None:
    if not stem:
        return None
    hint = _IFACE_STACK_SWITCH.get(stem)
    return dict(hint) if hint else None


def _option_stack_switch(stem: str | None) -> list[dict[str, Any]]:
    if not stem:
        return []
    hints = _OPTION_STACK_SWITCH.get(stem) or []
    return [dict(h) for h in hints]


def _res_roots() -> list[Path]:
    roots: list[Path] = []
    if settings.res_dir:
        roots.append(Path(settings.res_dir))
    roots.append(_REPO_ROOT / "webui" / ".res")
    roots.append(_REPO_ROOT / "src" / "res")
    return roots


def res_dir() -> Path:
    for root in _res_roots():
        if (root / "platform").is_dir() and (root / "os").is_dir():
            return root
    raise FileNotFoundError("FWB resources (platform/os) not found; build webui/.res first")


def _text(el: ET.Element | None, default: str = "") -> str:
    if el is None or el.text is None:
        return default
    return el.text.strip()


def _child_map(parent: ET.Element | None) -> dict[str, str]:
    out: dict[str, str] = {}
    if parent is None:
        return out
    for child in list(parent):
        tag = child.tag
        if not isinstance(tag, str) or tag.startswith("{"):
            continue
        # Nested sections (activation, …) stay as presence markers only when leaf text.
        if list(child):
            continue
        out[tag] = (child.text or "").strip()
    return out


def _parse_target(path: Path) -> dict[str, Any] | None:
    try:
        root = ET.parse(path).getroot()
    except ET.ParseError:
        return None
    target = root.find("Target")
    if target is None:
        return None
    name = target.get("name") or path.stem
    options = target.find("options")
    defaults = _child_map(options.find("default") if options is not None else None)
    iface_defaults = _child_map(options.find("interface") if options is not None else None)
    # Also surface non-default option flags that are simple leaves under <options>
    option_flags: dict[str, str] = {}
    if options is not None:
        for child in list(options):
            if child.tag in {"default", "activation", "interface"}:
                continue
            if list(child):
                continue
            option_flags[child.tag] = (child.text or "").strip()

    caps_el = target.find("capabilities")
    capabilities = _child_map(caps_el)

    supported = _text(target.find("supported_os"))
    return {
        "name": name,
        "description": _text(target.find("description"), name),
        "status": _text(target.find("status"), "unknown"),
        "group": _text(target.find("group")),
        "family": _text(target.find("family")),
        "compiler": _text(target.find("compiler")),
        "dialog": _text(target.find("dialog")),
        "interface_dialog": _text(target.find("interface_dialog")),
        "supported_os": [s.strip() for s in supported.split(",") if s.strip()],
        "defaults": defaults,
        "interface_defaults": iface_defaults,
        "option_flags": option_flags,
        "capabilities": capabilities,
        "source": str(path),
    }


@lru_cache(maxsize=1)
def _load_all() -> tuple[dict[str, dict[str, Any]], dict[str, dict[str, Any]]]:
    root = res_dir()
    platforms: dict[str, dict[str, Any]] = {}
    oss: dict[str, dict[str, Any]] = {}
    for path in sorted((root / "platform").glob("*.xml")):
        parsed = _parse_target(path)
        if parsed and parsed.get("status") != "retired":
            platforms[parsed["name"]] = parsed
    for path in sorted((root / "os").glob("*.xml")):
        parsed = _parse_target(path)
        if parsed:
            oss[parsed["name"]] = parsed
    return platforms, oss


def list_platforms() -> list[dict[str, Any]]:
    platforms, _ = _load_all()
    rows = []
    for p in platforms.values():
        rows.append(
            {
                "name": p["name"],
                "description": p["description"],
                "status": p["status"],
                "group": p["group"],
                "compiler": p["compiler"],
                "supported_os": p["supported_os"],
            }
        )
    return sorted(rows, key=lambda r: (r.get("group") or "", r["name"]))


def list_oses() -> list[dict[str, Any]]:
    _, oss = _load_all()
    rows = []
    for o in oss.values():
        rows.append(
            {
                "name": o["name"],
                "description": o["description"],
                "status": o["status"],
                "family": o["family"],
            }
        )
    return sorted(rows, key=lambda r: r["name"])


def get_platform(name: str) -> dict[str, Any]:
    platforms, _ = _load_all()
    key = (name or "").strip()
    if key not in platforms:
        raise KeyError(name)
    return platforms[key]


def get_os(name: str) -> dict[str, Any]:
    _, oss = _load_all()
    key = (name or "").strip()
    if key not in oss:
        raise KeyError(name)
    return oss[key]


def compiler_for_platform_name(platform: str) -> str | None:
    try:
        return get_platform(platform).get("compiler") or None
    except KeyError:
        return None


@lru_cache(maxsize=1)
def _dialog_catalog() -> dict[str, Any]:
    if not _DIALOG_FIELDS_PATH.is_file():
        return {"dialogs": {}, "by_platform_dialog": {}}
    return json.loads(_DIALOG_FIELDS_PATH.read_text(encoding="utf-8"))


def _dialog_stem(dialog_name: str | None) -> str | None:
    if not dialog_name:
        return None
    cat = _dialog_catalog()
    mapping = cat.get("by_platform_dialog") or {}
    return mapping.get(dialog_name) or mapping.get(dialog_name.lower())


def _iface_dialog_stem(dialog_name: str | None) -> str | None:
    if not dialog_name:
        return None
    cat = _dialog_catalog()
    mapping = cat.get("by_interface_dialog") or {}
    key = dialog_name.strip()
    return mapping.get(key) or mapping.get(key.lower())


def dialog_fields_for(platform: str, host_os: str = "") -> dict[str, dict[str, Any]]:
    """Merge platform + OS AdvancedDialog field metadata (widget types)."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    fields: dict[str, dict[str, Any]] = {}

    def merge(dialog_name: str | None) -> None:
        stem = _dialog_stem(dialog_name)
        if not stem:
            return
        info = dialogs.get(stem) or {}
        for key, meta in (info.get("fields") or {}).items():
            fields[key] = dict(meta)

    try:
        plat = get_platform(platform)
        merge(plat.get("dialog") or platform)
    except KeyError:
        merge(platform)
    if host_os:
        try:
            os_info = get_os(host_os)
            merge(os_info.get("dialog") or host_os)
        except KeyError:
            merge(host_os)
    return fields


def dialog_chrome_for(platform: str) -> dict[str, Any]:
    """windowTitle / geometry from the platform AdvancedDialog .ui."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    try:
        plat = get_platform(platform)
        stem = _dialog_stem(plat.get("dialog") or platform)
    except KeyError:
        stem = _dialog_stem(platform)
    if not stem or stem not in dialogs:
        return {}
    info = dialogs[stem]
    out: dict[str, Any] = {}
    if info.get("window_title"):
        out["window_title"] = info["window_title"]
    if info.get("geometry"):
        out["geometry"] = info["geometry"]
    if info.get("tab_position"):
        out["tab_position"] = info["tab_position"]
    if "size_grip_enabled" in info:
        out["size_grip_enabled"] = bool(info["size_grip_enabled"])
    return out


def _layout_fidelity_from_dialog(stem: str, info: dict[str, Any]) -> dict[str, Any]:
    """Coverage stats for one extracted dialog (not pixel parity)."""
    fields = info.get("fields") or {}
    pages = info.get("pages") or []
    n = max(len(fields), 1)
    field_stats = {
        "fields": len(fields),
        "with_grid": sum(1 for v in fields.values() if v.get("grid")),
        "with_label": sum(1 for v in fields.values() if v.get("label")),
        "with_tooltip": sum(1 for v in fields.values() if v.get("tooltip")),
        "with_whats_this": sum(1 for v in fields.values() if v.get("whats_this")),
        "with_size_policy": sum(1 for v in fields.values() if v.get("size_policy")),
        "with_minimum_size": sum(1 for v in fields.values() if v.get("minimum_size")),
        "with_maximum_size": sum(1 for v in fields.values() if v.get("maximum_size")),
        "with_alignment": sum(1 for v in fields.values() if v.get("alignment")),
        "with_external_label": sum(1 for v in fields.values() if v.get("external_label")),
        "with_enabled": sum(1 for v in fields.values() if "enabled" in v),
        "with_read_only": sum(1 for v in fields.values() if "read_only" in v),
    }
    stacked_secs = [
        s
        for p in pages
        for s in (p.get("sections") or [])
        if s.get("stacked")
    ]
    page_stats = {
        "pages": len(pages),
        "spacers": sum(len(p.get("spacers") or []) for p in pages),
        "spacers_with_size_hint": sum(
            1 for p in pages for s in (p.get("spacers") or []) if s.get("size_hint")
        ),
        "annotations": sum(len(p.get("annotations") or []) for p in pages),
        "buddy_labels": sum(len(p.get("buddy_labels") or []) for p in pages),
        "pages_with_tooltip": sum(1 for p in pages if p.get("tooltip")),
        "pages_with_column_stretch": sum(1 for p in pages if p.get("column_stretch")),
        "pages_with_row_stretch": sum(1 for p in pages if p.get("row_stretch")),
        "pages_with_spacing": sum(1 for p in pages if p.get("spacing")),
        "pages_with_layout_tree": sum(1 for p in pages if p.get("layout_tree")),
        "stacked_sections": len(stacked_secs),
        "empty_stacked_sections": sum(1 for s in stacked_secs if s.get("empty")),
        "stack_names": sorted({s.get("stack") for s in stacked_secs if s.get("stack")}),
    }
    chrome = {
        "window_title": bool(info.get("window_title")),
        "geometry": bool(info.get("geometry")),
        "tab_position": bool(info.get("tab_position")),
        "size_grip_enabled": "size_grip_enabled" in info,
    }
    score_parts = [
        field_stats["with_grid"] / n,
        field_stats["with_label"] / n,
        field_stats["with_size_policy"] / n,
        min(page_stats["spacers_with_size_hint"], n) / n if page_stats["spacers"] else 0.0,
        1.0 if chrome["geometry"] else 0.0,
        1.0 if page_stats["pages_with_spacing"] else 0.0,
        1.0 if page_stats["pages_with_layout_tree"] else 0.0,
        # Presence of QStackedWidget extraction (not desktop pixel switch behavior).
        1.0 if page_stats["stacked_sections"] else 0.0,
    ]
    score = round(100.0 * (sum(score_parts) / len(score_parts)), 1)
    return {
        "ok": True,
        "dialog": stem,
        "pixel_parity": False,
        "score_percent": score,
        "note": (
            "Heuristic coverage of extracted .ui layout signals. "
            "score_percent is not pixel-perfect Qt parity."
        ),
        "fields": field_stats,
        "pages": page_stats,
        "chrome": chrome,
    }


def layout_fidelity_for(platform: str, host_os: str = "") -> dict[str, Any]:
    """Coverage stats for extracted .ui layout signals (not pixel parity)."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    try:
        plat = get_platform(platform)
        stem = _dialog_stem(plat.get("dialog") or platform)
    except KeyError:
        stem = _dialog_stem(platform)
    if not stem or stem not in dialogs:
        return {
            "ok": False,
            "error": "dialog_not_found",
            "platform": platform,
            "host_os": host_os or None,
            "pixel_parity": False,
        }
    out = _layout_fidelity_from_dialog(stem, dialogs[stem])
    out["platform"] = platform
    out["host_os"] = host_os or None
    opt_hints = _option_stack_switch(stem)
    if opt_hints:
        out["stack_switch"] = opt_hints
    iface_hint: dict[str, Any] | None = None
    if host_os:
        try:
            os_info = get_os(host_os)
            iface_stem = _iface_dialog_stem(os_info.get("interface_dialog") or "")
            iface_hint = _iface_stack_switch(iface_stem)
        except KeyError:
            iface_hint = None
    if iface_hint:
        out["iface_stack_switch"] = iface_hint
    return out


def stack_switch_for(platform: str = "", host_os: str = "") -> dict[str, Any]:
    """Desktop QStackedWidget switch maps for WebUI preview/follow (not pixel)."""
    plat_stem: str | None = None
    if platform:
        try:
            plat = get_platform(platform)
            plat_stem = _dialog_stem(plat.get("dialog") or platform)
        except KeyError:
            plat_stem = _dialog_stem(platform)
    iface_stem: str | None = None
    if host_os:
        try:
            os_info = get_os(host_os)
            iface_stem = _iface_dialog_stem(os_info.get("interface_dialog") or "")
        except KeyError:
            iface_stem = None
    return {
        "ok": True,
        "platform": platform or None,
        "host_os": host_os or None,
        "dialog_stem": plat_stem,
        "interface_dialog_stem": iface_stem,
        "option_stack_switch": _option_stack_switch(plat_stem),
        "iface_stack_switch": _iface_stack_switch(iface_stem),
        "pixel_parity": False,
        "note": (
            "Maps how desktop switches QStackedWidget pages; WebUI uses them for "
            "preview/follow only — not full pixel layout or Interface type writes."
        ),
    }


def dialog_pages_for(platform: str, host_os: str = "") -> list[dict[str, Any]]:
    """Qt AdvancedDialog tab pages with option keys (platform dialog preferred)."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    pages: list[dict[str, Any]] = []
    try:
        plat = get_platform(platform)
        stem = _dialog_stem(plat.get("dialog") or platform)
    except KeyError:
        stem = _dialog_stem(platform)
    if stem and stem in dialogs:
        pages = list(dialogs[stem].get("pages") or [])
    if host_os:
        try:
            os_info = get_os(host_os)
            os_stem = _dialog_stem(os_info.get("dialog") or host_os)
        except KeyError:
            os_stem = _dialog_stem(host_os)
        if os_stem and os_stem in dialogs:
            for page in dialogs[os_stem].get("pages") or []:
                entry: dict[str, Any] = {
                    "id": f"os-{page.get('id')}",
                    "title": f"OS · {page.get('title')}",
                    "keys": page.get("keys") or [],
                }
                if page.get("sections"):
                    entry["sections"] = page.get("sections")
                pages.append(entry)
    return pages


def _infer_type(key: str, value: str, meta: dict[str, Any] | None) -> dict[str, Any]:
    if meta:
        out = {
            "type": meta.get("type") or "string",
            "choices": meta.get("choices"),
            "widget": meta.get("widget"),
            "widget_class": meta.get("widget_class"),
        }
        for flag in (
            "label",
            "tooltip",
            "whats_this",
            "grid",
            "size_policy",
            "minimum_size",
            "maximum_size",
            "alignment",
            "external_label",
            "enabled",
            "visible",
            "read_only",
        ):
            if flag in meta and meta.get(flag) is not None:
                out[flag] = meta.get(flag)
        return out

    low = (value or "").strip().lower()
    if low in {"true", "false"}:
        return {"type": "bool"}
    if key in {"prolog_script", "epilog_script"}:
        return {"type": "text"}
    return {"type": "string"}


def option_schema(platform: str, host_os: str = "") -> dict[str, Any]:
    """Build grouped option keys for the WebUI editor."""
    plat = get_platform(platform)
    os_info: dict[str, Any] | None = None
    if host_os:
        try:
            os_info = get_os(host_os)
        except KeyError:
            os_info = None

    field_meta = dialog_fields_for(platform, host_os)
    pages = dialog_pages_for(platform, host_os)
    platform_keys = sorted(plat.get("defaults", {}).keys())
    os_keys = sorted((os_info or {}).get("defaults", {}).keys()) if os_info else []

    # Prefer real Qt dialog tab pages when available; keep fallback groups otherwise.
    if pages:
        groups = []
        for p in pages:
            g: dict[str, Any] = {"id": p["id"], "title": p["title"], "keys": p["keys"]}
            if p.get("sections"):
                g["sections"] = p["sections"]
            if p.get("tooltip"):
                g["tooltip"] = p["tooltip"]
            if p.get("spacers"):
                g["spacers"] = p["spacers"]
            if p.get("column_stretch"):
                g["column_stretch"] = p["column_stretch"]
            if p.get("row_stretch"):
                g["row_stretch"] = p["row_stretch"]
            if p.get("spacing"):
                g["spacing"] = p["spacing"]
            if p.get("layouts"):
                g["layouts"] = p["layouts"]
            if p.get("layout_tree"):
                g["layout_tree"] = p["layout_tree"]
            if p.get("annotations"):
                g["annotations"] = p["annotations"]
            if p.get("buddy_labels"):
                g["buddy_labels"] = p["buddy_labels"]
            groups.append(g)
        # Append any installer/script keys missing from pages so deploy still editable.
        page_keys = {k for p in pages for k in p.get("keys") or []}
        missing_installer = [k for k in INSTALLER_KEYS if k not in page_keys]
        if missing_installer:
            groups.append({"id": "installer-extra", "title": "Installer (extra)", "keys": missing_installer})
    else:
        groups = [
            {
                "id": "installer",
                "title": "Installer / deploy",
                "keys": list(INSTALLER_KEYS),
            },
            {
                "id": "platform",
                "title": f"Platform defaults ({plat['name']})",
                "keys": platform_keys,
            },
        ]
        if os_keys:
            groups.append(
                {
                    "id": "os",
                    "title": f"OS defaults ({host_os})",
                    "keys": os_keys,
                }
            )
        groups.append(
            {
                "id": "scripts",
                "title": "Scripts / diagnostics",
                "keys": list(COMMON_KEYS),
            }
        )
    featured: list[str] = []
    seen: set[str] = set()
    for g in groups:
        for k in g["keys"]:
            if k not in seen:
                featured.append(k)
                seen.add(k)

    defaults = {
        **((os_info or {}).get("defaults") or {}),
        **(plat.get("defaults") or {}),
    }
    fields: dict[str, Any] = {}
    for key in seen:
        fields[key] = _infer_type(key, defaults.get(key, ""), field_meta.get(key))

    chrome = dialog_chrome_for(platform)
    fidelity = layout_fidelity_for(platform, host_os)
    stem = _dialog_stem(plat.get("dialog") or platform)
    stack_switch = _option_stack_switch(stem)
    out: dict[str, Any] = {
        "platform": plat["name"],
        "host_os": host_os or None,
        "compiler": plat.get("compiler"),
        "dialog": plat.get("dialog"),
        "dialog_stem": stem,
        "description": plat.get("description"),
        "supported_os": plat.get("supported_os"),
        "capabilities": plat.get("capabilities"),
        **chrome,
        "defaults": defaults,
        "groups": groups,
        "featured_keys": featured,
        "fields": fields,
        "dialog_field_count": len(field_meta),
        "dialog_pages": pages,
        "layout_fidelity": {
            "score_percent": fidelity.get("score_percent"),
            "pixel_parity": False,
            "path": "/api/v1/layout-fidelity",
        },
    }
    if stack_switch:
        out["stack_switch"] = stack_switch
    return out


def _rule_dialog_stem(rule_kind: str | None) -> str | None:
    if not rule_kind:
        return None
    cat = _dialog_catalog()
    mapping = cat.get("by_rule_dialog") or {}
    key = rule_kind.strip()
    return mapping.get(key) or mapping.get(key.lower())


def _groups_from_pages(pages: list[dict[str, Any]]) -> list[dict[str, Any]]:
    groups: list[dict[str, Any]] = []
    for p in pages:
        g: dict[str, Any] = {
            "id": p.get("id"),
            "title": p.get("title"),
            "keys": list(p.get("keys") or []),
        }
        if p.get("sections"):
            g["sections"] = p["sections"]
        if p.get("tooltip"):
            g["tooltip"] = p["tooltip"]
        if p.get("spacers"):
            g["spacers"] = p["spacers"]
        if p.get("column_stretch"):
            g["column_stretch"] = p["column_stretch"]
        if p.get("row_stretch"):
            g["row_stretch"] = p["row_stretch"]
        if p.get("spacing"):
            g["spacing"] = p["spacing"]
        if p.get("layouts"):
            g["layouts"] = p["layouts"]
        if p.get("layout_tree"):
            g["layout_tree"] = p["layout_tree"]
        if p.get("annotations"):
            g["annotations"] = p["annotations"]
        if p.get("buddy_labels"):
            g["buddy_labels"] = p["buddy_labels"]
        groups.append(g)
    return groups


def rule_option_schema(rule_kind: str = "policy") -> dict[str, Any]:
    """Field metadata for Policy/NAT/Routing rule options dialogs."""
    kind = (rule_kind or "policy").strip() or "policy"
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    stem = _rule_dialog_stem(kind)
    field_meta: dict[str, dict[str, Any]] = {}
    pages: list[dict[str, Any]] = []
    if stem and stem in dialogs:
        info = dialogs[stem]
        field_meta = {k: dict(v) for k, v in (info.get("fields") or {}).items()}
        pages = list(info.get("pages") or [])
    if pages:
        groups = _groups_from_pages(pages)
    elif field_meta:
        groups = [{"id": "rule", "title": "Rule options", "keys": sorted(field_meta.keys())}]
    else:
        groups = []
    featured: list[str] = []
    seen: set[str] = set()
    for g in groups:
        for k in g["keys"]:
            if k not in seen:
                featured.append(k)
                seen.add(k)
    fields: dict[str, Any] = {}
    for key in seen:
        fields[key] = _infer_type(key, "", field_meta.get(key))
    fidelity: dict[str, Any] | None = None
    if stem and stem in dialogs:
        fidelity = {
            "score_percent": _layout_fidelity_from_dialog(stem, dialogs[stem]).get(
                "score_percent"
            ),
            "pixel_parity": False,
            "path": "/api/v1/layout-fidelity",
        }
    return {
        "rule_kind": kind,
        "dialog_stem": stem,
        "groups": groups,
        "featured_keys": featured,
        "fields": fields,
        "dialog_field_count": len(field_meta),
        "dialog_pages": pages,
        "layout_fidelity": fidelity,
    }


def interface_option_schema(host_os: str) -> dict[str, Any]:
    """Grouped InterfaceOptions keys from OS interface_dialog + resource defaults."""
    os_info = get_os(host_os)
    iface_dialog = (os_info.get("interface_dialog") or "").strip()
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    stem = _iface_dialog_stem(iface_dialog)
    field_meta: dict[str, dict[str, Any]] = {}
    pages: list[dict[str, Any]] = []
    if stem and stem in dialogs:
        info = dialogs[stem]
        field_meta = {k: dict(v) for k, v in (info.get("fields") or {}).items()}
        pages = list(info.get("pages") or [])

    defaults = dict(os_info.get("interface_defaults") or {})
    # Ensure dialog keys appear even when resource XML has no <interface> defaults.
    for key in field_meta:
        defaults.setdefault(key, "")

    if pages:
        groups = _groups_from_pages(pages)
    elif field_meta:
        groups = [{"id": "interface", "title": "Interface", "keys": sorted(field_meta.keys())}]
    elif defaults:
        groups = [{"id": "interface", "title": "Interface", "keys": sorted(defaults.keys())}]
    else:
        groups = []

    featured: list[str] = []
    seen: set[str] = set()
    for g in groups:
        for k in g["keys"]:
            if k not in seen:
                featured.append(k)
                seen.add(k)
    for k in defaults:
        if k not in seen:
            featured.append(k)
            seen.add(k)
            if groups:
                groups[0]["keys"].append(k)
            else:
                groups = [{"id": "interface", "title": "Interface", "keys": [k]}]

    fields: dict[str, Any] = {}
    for key in seen:
        fields[key] = _infer_type(key, defaults.get(key, ""), field_meta.get(key))

    caps = os_info.get("capabilities") or {}
    fidelity: dict[str, Any] | None = None
    if stem and stem in dialogs:
        fidelity = {
            "score_percent": _layout_fidelity_from_dialog(stem, dialogs[stem]).get(
                "score_percent"
            ),
            "pixel_parity": False,
            "path": "/api/v1/layout-fidelity",
        }
    out: dict[str, Any] = {
        "host_os": os_info["name"],
        "interface_dialog": iface_dialog or None,
        "dialog_stem": stem,
        "supports_advanced_interface_options": str(
            caps.get("supports_advanced_interface_options") or ""
        ).lower()
        in {"true", "1", "yes"},
        "defaults": defaults,
        "groups": groups,
        "featured_keys": featured,
        "fields": fields,
        "dialog_field_count": len(field_meta),
        "dialog_pages": pages,
        "layout_fidelity": fidelity,
    }
    stack_switch = _iface_stack_switch(stem)
    if stack_switch:
        out["stack_switch"] = stack_switch
    return out

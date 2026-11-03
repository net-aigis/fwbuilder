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
        if meta.get("label"):
            out["label"] = meta.get("label")
        if meta.get("tooltip"):
            out["tooltip"] = meta.get("tooltip")
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

    return {
        "platform": plat["name"],
        "host_os": host_os or None,
        "compiler": plat.get("compiler"),
        "dialog": plat.get("dialog"),
        "description": plat.get("description"),
        "supported_os": plat.get("supported_os"),
        "capabilities": plat.get("capabilities"),
        "defaults": defaults,
        "groups": groups,
        "featured_keys": featured,
        "fields": fields,
        "dialog_field_count": len(field_meta),
        "dialog_pages": pages,
    }


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
    return {
        "rule_kind": kind,
        "dialog_stem": stem,
        "groups": groups,
        "featured_keys": featured,
        "fields": fields,
        "dialog_field_count": len(field_meta),
        "dialog_pages": pages,
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
    return {
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
    }

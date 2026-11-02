"""Parse Firewall Builder platform/OS resource XML for WebUI option schemas."""

from __future__ import annotations

import xml.etree.ElementTree as ET
from functools import lru_cache
from pathlib import Path
from typing import Any

from .settings import settings

_REPO_ROOT = Path(__file__).resolve().parents[3]

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
    # Also surface non-default option flags that are simple leaves under <options>
    option_flags: dict[str, str] = {}
    if options is not None:
        for child in list(options):
            if child.tag in {"default", "activation"}:
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
        "supported_os": [s.strip() for s in supported.split(",") if s.strip()],
        "defaults": defaults,
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


def option_schema(platform: str, host_os: str = "") -> dict[str, Any]:
    """Build grouped option keys for the WebUI editor."""
    plat = get_platform(platform)
    os_info: dict[str, Any] | None = None
    if host_os:
        try:
            os_info = get_os(host_os)
        except KeyError:
            os_info = None

    platform_keys = sorted(plat.get("defaults", {}).keys())
    os_keys = sorted((os_info or {}).get("defaults", {}).keys()) if os_info else []
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
    return {
        "platform": plat["name"],
        "host_os": host_os or None,
        "compiler": plat.get("compiler"),
        "description": plat.get("description"),
        "supported_os": plat.get("supported_os"),
        "capabilities": plat.get("capabilities"),
        "defaults": {
            **((os_info or {}).get("defaults") or {}),
            **(plat.get("defaults") or {}),
        },
        "groups": groups,
        "featured_keys": featured,
    }

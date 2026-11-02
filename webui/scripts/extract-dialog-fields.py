#!/usr/bin/env python3
"""Extract option field metadata + tab pages from libgui AdvancedDialog .cpp + .ui."""

from __future__ import annotations

import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LIBGUI = ROOT / "src" / "libgui"
OUT = ROOT / "webui" / "backend" / "fwbweb_api" / "data" / "dialog_fields.json"

DIALOG_CPP = {
    "iptables": "iptAdvancedDialog",
    "nftables": "iptAdvancedDialog",
    "pf": "pfAdvancedDialog",
    "ipf": "ipfAdvancedDialog",
    "ipfw": "ipfwAdvancedDialog",
    "pix": "pixAdvancedDialog",
    "iosacl": "iosaclAdvancedDialog",
    "nxosacl": "nxosaclAdvancedDialog",
    "junosacl": "junosaclAdvancedDialog",
    "procurveacl": "procurveaclAdvancedDialog",
    "procurve_acl": "procurveaclAdvancedDialog",
    "ipcop": "ipcopAdvancedDialog",
    "secuwall": "secuwallAdvancedDialog",
    "linux24": "linux24AdvancedDialog",
    "linux317": "linux24AdvancedDialog",
    "freebsd": "freebsdAdvancedDialog",
    "openbsd": "openbsdAdvancedDialog",
    "solaris": "solarisAdvancedDialog",
    "macosx": "macosxAdvancedDialog",
    "pix_os": "pixosAdvancedDialog",
    "junos": "junosAdvancedDialog",
    "nxos": "nxosAdvancedDialog",
    "ios": "iosAdvancedDialog",
}

# OS <interface_dialog> resource name → IfaceOptsDialog stem
IFACE_DIALOG_CPP = {
    "linux24": "linux24IfaceOptsDialog",
    "linux317": "linux24IfaceOptsDialog",
    "secuwall": "secuwallIfaceOptsDialog",
    "pix_os": "pixosIfaceOptsDialog",
    "pixos": "pixosIfaceOptsDialog",
    "freebsd": "bsdIfaceOptsDialog",
    "openbsd": "bsdIfaceOptsDialog",
    "macosx": "bsdIfaceOptsDialog",
    "bsd": "bsdIfaceOptsDialog",
    "vlan_only": "vlanOnlyIfaceOptsDialog",
    "procurve": "vlanOnlyIfaceOptsDialog",
}

UI_MAP = {
    "iptAdvancedDialog": "iptadvanceddialog_q.ui",
    "pfAdvancedDialog": "pfadvanceddialog_q.ui",
    "ipfAdvancedDialog": "ipfadvanceddialog_q.ui",
    "ipfwAdvancedDialog": "ipfwadvanceddialog_q.ui",
    "pixAdvancedDialog": "pixadvanceddialog_q.ui",
    "linux24AdvancedDialog": "linux24advanceddialog_q.ui",
    "pixosAdvancedDialog": "pixosadvanceddialog_q.ui",
    "iosaclAdvancedDialog": "iosacladvanceddialog_q.ui",
    "nxosaclAdvancedDialog": "nxosacladvanceddialog_q.ui",
    "junosaclAdvancedDialog": "junosacladvanceddialog_q.ui",
    "procurveaclAdvancedDialog": "procurveacladvanceddialog_q.ui",
    "secuwallAdvancedDialog": "secuwalladvanceddialog_q.ui",
    "ipcopAdvancedDialog": "ipcopadvanceddialog_q.ui",
    "freebsdAdvancedDialog": "freebsdadvanceddialog_q.ui",
    "openbsdAdvancedDialog": "openbsdadvanceddialog_q.ui",
    "solarisAdvancedDialog": "solarisadvanceddialog_q.ui",
    "macosxAdvancedDialog": "macosxadvanceddialog_q.ui",
    "junosAdvancedDialog": "junosadvanceddialog_q.ui",
    "nxosAdvancedDialog": "nxosadvanceddialog_q.ui",
    "iosAdvancedDialog": "iosadvanceddialog_q.ui",
    "ipcoposAdvancedDialog": "ipcoposadvanceddialog_q.ui",
    "linksysAdvancedDialog": "linksysadvanceddialog_q.ui",
    "secuwallosAdvancedDialog": "secuwallosadvanceddialog_q.ui",
}

WIDGET_TYPE = {
    "QCheckBox": "bool",
    "QComboBox": "enum",
    "QSpinBox": "int",
    "QDoubleSpinBox": "number",
    "QLineEdit": "string",
    "QTextEdit": "text",
    "QPlainTextEdit": "text",
}

KNOWN_ENUMS: dict[str, list[str]] = {
    "log_level": ["emerg", "alert", "crit", "error", "warning", "notice", "info", "debug"],
    "prolog_place": ["top", "after_interfaces", "after_flush"],
    "ipv4_6_order": ["ipv4_first", "ipv6_first"],
}

REG_OPT = re.compile(
    r"registerOption\s*\(\s*m_dialog\s*->\s*(\w+)\s*,\s*[^,]+,\s*\"([^\"]+)\"(?:\s*,\s*(\w+))?\s*\)",
    re.MULTILINE,
)

CONTROL_CLASSES = set(WIDGET_TYPE)


def load_ui(ui_path: Path) -> ET.Element | None:
    if not ui_path.is_file():
        return None
    text = ui_path.read_text(encoding="utf-8", errors="replace")
    text = re.sub(r'\sxmlns="[^"]+"', "", text, count=1)
    return ET.fromstring(text)


def parse_ui_widgets(root: ET.Element | None) -> dict[str, str]:
    out: dict[str, str] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        cls = w.get("class")
        if name and cls:
            out[name] = cls
    return out


def parse_combo_items(root: ET.Element | None, widget_name: str) -> list[str]:
    if root is None:
        return []
    for w in root.iter("widget"):
        if w.get("name") != widget_name:
            continue
        items: list[str] = []
        for item in w.findall("./item"):
            prop = item.find("./property[@name='text']/string")
            if prop is not None and prop.text:
                items.append(prop.text.strip())
        return items
    return []


def parse_pages(root: ET.Element | None) -> list[dict]:
    """Return tab pages: {id, title, widgets:[widget names]}."""
    if root is None:
        return []
    pages: list[dict] = []
    for tw in root.iter("widget"):
        if tw.get("class") != "QTabWidget":
            continue
        for page in list(tw):
            if page.tag != "widget" or page.get("class") != "QWidget":
                continue
            title = ""
            for attr in page.findall("attribute"):
                if attr.get("name") == "title":
                    s = attr.find("string")
                    title = (s.text or "").strip() if s is not None else ""
            widgets: list[str] = []
            for w in page.iter("widget"):
                name = w.get("name")
                cls = w.get("class") or ""
                if name and cls in CONTROL_CLASSES:
                    widgets.append(name)
            pages.append(
                {
                    "id": page.get("name") or f"page{len(pages)}",
                    "title": title or page.get("name") or f"Page {len(pages)+1}",
                    "widgets": widgets,
                }
            )
        if pages:
            break  # primary tab widget only
    return pages


def extract_cpp(cpp_path: Path, ui_root: ET.Element | None, ui_widgets: dict[str, str]) -> dict[str, dict]:
    src = cpp_path.read_text(encoding="utf-8", errors="replace")
    fields: dict[str, dict] = {}
    for m in REG_OPT.finditer(src):
        widget, key, _mapping = m.group(1), m.group(2), m.group(3)
        cls = ui_widgets.get(widget, "")
        ftype = WIDGET_TYPE.get(cls, "string")
        field: dict = {"key": key, "widget": widget, "widget_class": cls or None, "type": ftype}
        if ftype == "enum":
            choices = parse_combo_items(ui_root, widget) or KNOWN_ENUMS.get(key, [])
            if choices:
                field["choices"] = choices
            else:
                field["type"] = "string"
        if key in KNOWN_ENUMS and "choices" not in field:
            field["type"] = "enum"
            field["choices"] = KNOWN_ENUMS[key]
        fields[key] = field
    return fields


def pages_with_keys(pages: list[dict], fields: dict[str, dict]) -> list[dict]:
    widget_to_keys: dict[str, list[str]] = {}
    for key, meta in fields.items():
        w = meta.get("widget")
        if not w:
            continue
        widget_to_keys.setdefault(w, []).append(key)
    out = []
    for page in pages:
        keys: list[str] = []
        seen: set[str] = set()
        for w in page.get("widgets") or []:
            for key in widget_to_keys.get(w, []):
                if key not in seen:
                    keys.append(key)
                    seen.add(key)
        if keys:
            out.append({"id": page["id"], "title": page["title"], "keys": keys})
    return out


def extract_one(cpp: Path) -> dict:
    stem = cpp.stem
    ui_path = LIBGUI / UI_MAP.get(stem, f"{stem.lower()}_q.ui")
    for c in (LIBGUI / f"{stem.lower()}_q.ui", LIBGUI / f"{stem}_q.ui"):
        if c.is_file():
            ui_path = c
            break
    ui_root = load_ui(ui_path)
    widgets = parse_ui_widgets(ui_root)
    fields = extract_cpp(cpp, ui_root, widgets)
    pages = pages_with_keys(parse_pages(ui_root), fields)
    # Iface dialogs are often single-page (no QTabWidget) — synthesize one page.
    if not pages and fields:
        pages = [
            {
                "id": "main",
                "title": "Interface",
                "keys": sorted(fields.keys()),
            }
        ]
    return {
        "ui": ui_path.name if ui_path.is_file() else None,
        "field_count": len(fields),
        "fields": fields,
        "pages": pages,
    }


def main() -> None:
    catalog: dict[str, dict] = {
        "dialogs": {},
        "by_platform_dialog": {},
        "by_interface_dialog": {},
    }
    for cpp in sorted(LIBGUI.glob("*AdvancedDialog.cpp")):
        catalog["dialogs"][cpp.stem] = extract_one(cpp)
    for cpp in sorted(LIBGUI.glob("*IfaceOptsDialog.cpp")):
        catalog["dialogs"][cpp.stem] = extract_one(cpp)

    for dlg_name, stem in DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_platform_dialog"][dlg_name] = stem
    for dlg_name, stem in IFACE_DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_interface_dialog"][dlg_name] = stem

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(catalog, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(f"wrote {OUT} dialogs={len(catalog['dialogs'])}")
    ipt = catalog["dialogs"].get("iptAdvancedDialog", {})
    print("ipt pages:", [(p["title"], len(p["keys"])) for p in ipt.get("pages", [])])
    linux = catalog["dialogs"].get("linux24IfaceOptsDialog", {})
    print(
        "linux24 iface fields:",
        sorted((linux.get("fields") or {}).keys()),
        "pages:",
        len(linux.get("pages") or []),
    )


if __name__ == "__main__":
    main()

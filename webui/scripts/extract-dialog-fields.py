#!/usr/bin/env python3
"""Extract option field metadata from libgui AdvancedDialog .cpp + .ui files."""

from __future__ import annotations

import json
import re
import xml.etree.ElementTree as ET
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LIBGUI = ROOT / "src" / "libgui"
OUT = ROOT / "webui" / "backend" / "fwbweb_api" / "data" / "dialog_fields.json"

# resources <dialog> name → AdvancedDialog translation unit stem
DIALOG_CPP = {
    "iptables": "iptAdvancedDialog",
    "nftables": "iptAdvancedDialog",  # no dedicated nft dialog; reuse iptables UI
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

WIDGET_TYPE = {
    "QCheckBox": "bool",
    "QComboBox": "enum",
    "QSpinBox": "int",
    "QDoubleSpinBox": "number",
    "QLineEdit": "string",
    "QTextEdit": "text",
    "QPlainTextEdit": "text",
}

# Fallback enums when UI combo items aren't static in .ui
KNOWN_ENUMS: dict[str, list[str]] = {
    "log_level": ["emerg", "alert", "crit", "error", "warning", "notice", "info", "debug"],
    "prolog_place": ["top", "after_interfaces", "after_flush"],
    "ipv4_6_order": ["ipv4_first", "ipv6_first"],
}

REG_OPT = re.compile(
    r"registerOption\s*\(\s*m_dialog\s*->\s*(\w+)\s*,\s*[^,]+,\s*\"([^\"]+)\"(?:\s*,\s*(\w+))?\s*\)",
    re.MULTILINE,
)


def parse_ui_widgets(ui_path: Path) -> dict[str, str]:
    if not ui_path.is_file():
        return {}
    # Qt .ui uses namespaces sometimes; ElementTree without ns
    text = ui_path.read_text(encoding="utf-8", errors="replace")
    # strip default xmlns to simplify
    text = re.sub(r'\sxmlns="[^"]+"', "", text, count=1)
    root = ET.fromstring(text)
    out: dict[str, str] = {}
    for w in root.iter("widget"):
        name = w.get("name")
        cls = w.get("class")
        if name and cls:
            out[name] = cls
    return out


def parse_combo_items(ui_path: Path, widget_name: str) -> list[str]:
    if not ui_path.is_file():
        return []
    text = ui_path.read_text(encoding="utf-8", errors="replace")
    text = re.sub(r'\sxmlns="[^"]+"', "", text, count=1)
    root = ET.fromstring(text)
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


def extract_cpp(cpp_path: Path, ui_widgets: dict[str, str], ui_path: Path) -> dict[str, dict]:
    src = cpp_path.read_text(encoding="utf-8", errors="replace")
    fields: dict[str, dict] = {}
    for m in REG_OPT.finditer(src):
        widget, key, _mapping = m.group(1), m.group(2), m.group(3)
        cls = ui_widgets.get(widget, "")
        ftype = WIDGET_TYPE.get(cls, "string")
        field: dict = {"key": key, "widget": widget, "widget_class": cls or None, "type": ftype}
        if ftype == "enum":
            choices = parse_combo_items(ui_path, widget) or KNOWN_ENUMS.get(key, [])
            if choices:
                field["choices"] = choices
            else:
                field["type"] = "string"  # free combo without static items
        if key in KNOWN_ENUMS and "choices" not in field:
            field["type"] = "enum"
            field["choices"] = KNOWN_ENUMS[key]
        fields[key] = field
    return fields


def main() -> None:
    catalog: dict[str, dict] = {"dialogs": {}, "by_platform_dialog": {}}
    # Index all *AdvancedDialog.cpp
    for cpp in sorted(LIBGUI.glob("*AdvancedDialog.cpp")):
        stem = cpp.stem  # iptAdvancedDialog
        # ui naming: iptadvanceddialog_q.ui
        ui_candidates = [
            LIBGUI / f"{stem.lower()}_q.ui",
            LIBGUI / f"{stem}_q.ui",
        ]
        # special cases
        ui_map = {
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
        }
        ui_path = LIBGUI / ui_map.get(stem, f"{stem.lower()}_q.ui")
        for c in ui_candidates:
            if c.is_file():
                ui_path = c
                break
        widgets = parse_ui_widgets(ui_path)
        fields = extract_cpp(cpp, widgets, ui_path)
        catalog["dialogs"][stem] = {
            "ui": ui_path.name if ui_path.is_file() else None,
            "field_count": len(fields),
            "fields": fields,
        }

    for dlg_name, stem in DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_platform_dialog"][dlg_name] = stem

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(catalog, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(f"wrote {OUT} dialogs={len(catalog['dialogs'])} mappings={len(catalog['by_platform_dialog'])}")
    for stem, info in sorted(catalog["dialogs"].items(), key=lambda x: -x[1]["field_count"])[:8]:
        print(f"  {stem}: {info['field_count']} fields ui={info['ui']}")


if __name__ == "__main__":
    main()

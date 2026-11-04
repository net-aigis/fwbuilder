#!/usr/bin/env python3
"""Extract option field metadata + tab pages from libgui AdvancedDialog .cpp + .ui."""

from __future__ import annotations

import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any

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

RULE_DIALOG_CPP = {
    "policy": "RuleOptionsDialog",
    "PolicyRule": "RuleOptionsDialog",
    "nat": "NATRuleOptionsDialog",
    "NATRule": "NATRuleOptionsDialog",
    "routing": "RoutingRuleOptionsDialog",
    "RoutingRule": "RoutingRuleOptionsDialog",
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
    "QRadioButton": "bool",
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


def parse_widget_labels(root: ET.Element | None) -> dict[str, str]:
    """Map widget objectName → human label from QCheckBox text or QLabel buddy."""
    labels: dict[str, str] = {}
    if root is None:
        return labels
    for w in root.iter("widget"):
        name = w.get("name")
        cls = w.get("class") or ""
        if not name:
            continue
        if cls in {"QCheckBox", "QRadioButton"}:
            prop = w.find("./property[@name='text']/string")
            if prop is not None and (prop.text or "").strip():
                labels[name] = prop.text.strip()
        elif cls == "QLabel":
            buddy = w.find("./property[@name='buddy']/cstring")
            text = w.find("./property[@name='text']/string")
            if (
                buddy is not None
                and (buddy.text or "").strip()
                and text is not None
                and (text.text or "").strip()
            ):
                labels[buddy.text.strip()] = text.text.strip()
    return labels


def parse_widget_tooltips(root: ET.Element | None) -> dict[str, str]:
    """Map widget objectName → toolTip from .ui."""
    tips: dict[str, str] = {}
    if root is None:
        return tips
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='toolTip']/string")
        if prop is not None and (prop.text or "").strip():
            tips[name] = prop.text.strip()
    return tips


def parse_widget_whats_this(root: ET.Element | None) -> dict[str, str]:
    """Map widget objectName → whatsThis from .ui (separate from toolTip)."""
    out: dict[str, str] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='whatsThis']/string")
        if prop is not None and (prop.text or "").strip():
            out[name] = prop.text.strip()
    return out


def parse_widget_size_policies(root: ET.Element | None) -> dict[str, dict[str, str]]:
    """Map widget objectName → {horizontal, vertical} sizePolicy from .ui."""
    out: dict[str, dict[str, str]] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='sizePolicy']/sizepolicy")
        if prop is None:
            continue
        hs = (prop.get("hsizetype") or "").strip()
        vs = (prop.get("vsizetype") or "").strip()
        if hs or vs:
            entry: dict[str, str] = {}
            if hs:
                entry["horizontal"] = hs
            if vs:
                entry["vertical"] = vs
            out[name] = entry
    return out


def _parse_size_prop(root: ET.Element | None, prop_name: str) -> dict[str, dict[str, int]]:
    """Map widget objectName → {width, height} for a .ui size property."""
    out: dict[str, dict[str, int]] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find(f"./property[@name='{prop_name}']/size")
        if prop is None:
            continue
        width_el = prop.find("width")
        height_el = prop.find("height")
        try:
            width = int((width_el.text or "0").strip()) if width_el is not None else 0
            height = int((height_el.text or "0").strip()) if height_el is not None else 0
        except ValueError:
            continue
        if width > 0 or height > 0:
            entry: dict[str, int] = {}
            if width > 0:
                entry["width"] = width
            if height > 0:
                entry["height"] = height
            out[name] = entry
    return out


def parse_widget_minimum_sizes(root: ET.Element | None) -> dict[str, dict[str, int]]:
    """Map widget objectName → {width, height} minimumSize from .ui."""
    return _parse_size_prop(root, "minimumSize")


def parse_widget_maximum_sizes(root: ET.Element | None) -> dict[str, dict[str, int]]:
    """Map widget objectName → {width, height} maximumSize from .ui."""
    return _parse_size_prop(root, "maximumSize")


def _grids_in_subtree(node: ET.Element) -> dict[str, dict[str, int]]:
    """Collect QGridLayout positions under a page/subtree (first hit per widget)."""
    positions: dict[str, dict[str, int]] = {}
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        for item in lay.findall("item"):
            try:
                row = int(item.get("row") or 0)
                col = int(item.get("column") or 0)
            except ValueError:
                continue
            rowspan = int(item.get("rowspan") or 1)
            colspan = int(item.get("colspan") or 1)
            for child in list(item):
                if child.tag != "widget":
                    continue
                name = child.get("name")
                if not name or name in positions:
                    continue
                positions[name] = {
                    "row": row,
                    "column": col,
                    "rowspan": rowspan,
                    "colspan": colspan,
                }
    return positions


def _spacers_in_subtree(node: ET.Element) -> list[dict[str, Any]]:
    """QSpacerItem cells in QGridLayouts (page-local layout holes)."""
    spacers: list[dict[str, Any]] = []
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        for item in lay.findall("item"):
            try:
                row = int(item.get("row") or 0)
                col = int(item.get("column") or 0)
            except ValueError:
                continue
            rowspan = int(item.get("rowspan") or 1)
            colspan = int(item.get("colspan") or 1)
            for child in list(item):
                if child.tag != "spacer":
                    continue
                orient_el = child.find("./property[@name='orientation']/enum")
                orient = (orient_el.text or "").strip() if orient_el is not None else ""
                if orient.startswith("Qt::"):
                    orient = orient[4:]
                entry: dict[str, Any] = {
                    "row": row,
                    "column": col,
                    "rowspan": rowspan,
                    "colspan": colspan,
                }
                if orient:
                    entry["orientation"] = orient
                name = child.get("name")
                if name:
                    entry["name"] = name
                sh = child.find("./property[@name='sizeHint']/size")
                if sh is not None:
                    try:
                        sw = int((sh.findtext("width") or "0").strip())
                        sh_h = int((sh.findtext("height") or "0").strip())
                        if sw > 0 or sh_h > 0:
                            hint: dict[str, int] = {}
                            if sw > 0:
                                hint["width"] = sw
                            if sh_h > 0:
                                hint["height"] = sh_h
                            if hint:
                                entry["size_hint"] = hint
                    except ValueError:
                        pass
                spacers.append(entry)
    return spacers


def parse_widget_alignments(root: ET.Element | None) -> dict[str, str]:
    """Map widget objectName → Qt alignment set string (Qt:: prefix stripped)."""
    out: dict[str, str] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='alignment']/set")
        if prop is None or not (prop.text or "").strip():
            continue
        raw = prop.text.strip()
        parts = []
        for part in raw.split("|"):
            part = part.strip()
            if part.startswith("Qt::"):
                part = part[4:]
            if part and part not in parts:
                parts.append(part)
        if parts:
            out[name] = "|".join(parts)
    return out


def parse_widget_enabled(root: ET.Element | None) -> dict[str, bool]:
    """Map widget objectName → enabled flag when .ui sets it explicitly."""
    out: dict[str, bool] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='enabled']/bool")
        if prop is None or prop.text is None:
            continue
        out[name] = prop.text.strip().lower() in {"true", "1"}
    return out


def parse_widget_visible(root: ET.Element | None) -> dict[str, bool]:
    """Map widget objectName → visible flag when .ui sets it explicitly."""
    out: dict[str, bool] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='visible']/bool")
        if prop is None or prop.text is None:
            continue
        out[name] = prop.text.strip().lower() in {"true", "1"}
    return out


def parse_widget_readonly(root: ET.Element | None) -> dict[str, bool]:
    """Map widget objectName → readOnly flag when .ui sets it explicitly."""
    out: dict[str, bool] = {}
    if root is None:
        return out
    for w in root.iter("widget"):
        name = w.get("name")
        if not name:
            continue
        prop = w.find("./property[@name='readOnly']/bool")
        if prop is None or prop.text is None:
            continue
        out[name] = prop.text.strip().lower() in {"true", "1"}
    return out


def _parse_stretch_list(raw: str | None) -> list[int]:
    if not raw or not str(raw).strip():
        return []
    out: list[int] = []
    for part in str(raw).split(","):
        part = part.strip()
        if not part:
            continue
        try:
            out.append(int(part))
        except ValueError:
            continue
    return out


def _column_stretch_in_subtree(node: ET.Element) -> list[int]:
    """Pick columnstretch from the busiest QGridLayout that declares one."""
    best: list[int] = []
    best_n = -1
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        stretch = _parse_stretch_list(lay.get("columnstretch"))
        if not stretch:
            continue
        n = len(lay.findall("item"))
        if n > best_n:
            best_n = n
            best = stretch
    return best


def _row_stretch_in_subtree(node: ET.Element) -> list[int]:
    """Pick rowstretch from the busiest QGridLayout that declares one."""
    best: list[int] = []
    best_n = -1
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        stretch = _parse_stretch_list(lay.get("rowstretch"))
        if not stretch:
            continue
        n = len(lay.findall("item"))
        if n > best_n:
            best_n = n
            best = stretch
    return best


def _grid_spacing_in_subtree(node: ET.Element) -> dict[str, int]:
    """Spacing/margins from the busiest QGridLayout under a page."""
    best: dict[str, int] = {}
    best_n = -1
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        n = len(lay.findall("item"))
        if n < best_n:
            continue
        entry: dict[str, int] = {}
        for prop, key in (
            ("spacing", "spacing"),
            ("horizontalSpacing", "horizontal"),
            ("verticalSpacing", "vertical"),
            ("leftMargin", "margin_left"),
            ("topMargin", "margin_top"),
            ("rightMargin", "margin_right"),
            ("bottomMargin", "margin_bottom"),
        ):
            el = lay.find(f"./property[@name='{prop}']/number")
            if el is None or not (el.text or "").strip():
                continue
            try:
                val = int(el.text.strip())
            except ValueError:
                continue
            if val >= 0:
                entry[key] = val
        if entry:
            best_n = n
            best = entry
    return best


def _layout_summary(node: ET.Element) -> dict[str, int]:
    """Count layout classes under a page (nested layout hint, not pixel geometry)."""
    counts: dict[str, int] = {}
    for lay in node.iter("layout"):
        cls = lay.get("class") or "layout"
        counts[cls] = counts.get(cls, 0) + 1
    return counts


def _qlabel_alignment(child: ET.Element) -> str | None:
    align_el = child.find("./property[@name='alignment']/set")
    if align_el is None or not (align_el.text or "").strip():
        return None
    parts: list[str] = []
    for part in align_el.text.strip().split("|"):
        part = part.strip()
        if part.startswith("Qt::"):
            part = part[4:]
        if part and part not in parts:
            parts.append(part)
    return "|".join(parts) if parts else None


def _annotations_in_subtree(node: ET.Element) -> list[dict[str, Any]]:
    """Free QLabel text cells (not buddy labels) with optional QGrid position."""
    annotations: list[dict[str, Any]] = []
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        for item in lay.findall("item"):
            try:
                row = int(item.get("row") or 0)
                col = int(item.get("column") or 0)
            except ValueError:
                continue
            rowspan = int(item.get("rowspan") or 1)
            colspan = int(item.get("colspan") or 1)
            for child in list(item):
                if child.tag != "widget" or child.get("class") != "QLabel":
                    continue
                buddy = child.find("./property[@name='buddy']/cstring")
                if buddy is not None and (buddy.text or "").strip():
                    continue  # field caption — see _buddy_labels_in_subtree
                text_el = child.find("./property[@name='text']/string")
                text = (text_el.text or "").strip() if text_el is not None else ""
                if not text or text in {":", "..."}:
                    continue
                entry: dict[str, Any] = {
                    "text": text,
                    "row": row,
                    "column": col,
                    "rowspan": rowspan,
                    "colspan": colspan,
                }
                name = child.get("name")
                if name:
                    entry["name"] = name
                align = _qlabel_alignment(child)
                if align:
                    entry["alignment"] = align
                annotations.append(entry)
    return annotations


def _buddy_labels_in_subtree(node: ET.Element) -> list[dict[str, Any]]:
    """QLabel cells with buddy= pointing at a control (separate grid caption/description)."""
    labels: list[dict[str, Any]] = []
    for lay in node.iter("layout"):
        if lay.get("class") != "QGridLayout":
            continue
        for item in lay.findall("item"):
            try:
                row = int(item.get("row") or 0)
                col = int(item.get("column") or 0)
            except ValueError:
                continue
            rowspan = int(item.get("rowspan") or 1)
            colspan = int(item.get("colspan") or 1)
            for child in list(item):
                if child.tag != "widget" or child.get("class") != "QLabel":
                    continue
                buddy_el = child.find("./property[@name='buddy']/cstring")
                buddy = (buddy_el.text or "").strip() if buddy_el is not None else ""
                if not buddy:
                    continue
                text_el = child.find("./property[@name='text']/string")
                text = (text_el.text or "").strip() if text_el is not None else ""
                if not text:
                    continue
                entry: dict[str, Any] = {
                    "text": text,
                    "buddy": buddy,
                    "row": row,
                    "column": col,
                    "rowspan": rowspan,
                    "colspan": colspan,
                }
                name = child.get("name")
                if name:
                    entry["name"] = name
                align = _qlabel_alignment(child)
                if align:
                    entry["alignment"] = align
                labels.append(entry)
    return labels


def parse_grid_positions(root: ET.Element | None) -> dict[str, dict[str, int]]:
    """Map widget → row/column, preferring per-tab-page grids then whole dialog."""
    positions: dict[str, dict[str, int]] = {}
    if root is None:
        return positions
    # Prefer page-local grids so row indices match the visible dialog page.
    for tw in root.iter("widget"):
        if tw.get("class") != "QTabWidget":
            continue
        for page in list(tw):
            if page.tag != "widget" or page.get("class") != "QWidget":
                continue
            for name, pos in _grids_in_subtree(page).items():
                positions.setdefault(name, pos)
        break
    # Fall back for dialogs without tabs / leftover widgets.
    for name, pos in _grids_in_subtree(root).items():
        positions.setdefault(name, pos)
    return positions


def _bool_prop(widget: ET.Element, name: str) -> bool | None:
    el = widget.find(f"./property[@name='{name}']/bool")
    if el is None or el.text is None:
        return None
    return el.text.strip().lower() in {"true", "1"}


def parse_stacked_sections(page: ET.Element) -> list[dict]:
    """QStackedWidget pages on a tab page as synthetic sections (layout hint)."""
    sections: list[dict] = []
    for stack in page.iter("widget"):
        if stack.get("class") != "QStackedWidget":
            continue
        stack_name = stack.get("name") or f"stack{len(sections)}"
        page_idx = 0
        for child in list(stack):
            if child.tag != "widget" or child.get("class") != "QWidget":
                continue
            title_el = None
            for attr in child.findall("attribute"):
                if attr.get("name") == "title":
                    title_el = attr.find("string")
            title = (title_el.text or "").strip() if title_el is not None else ""
            if not title:
                title = child.get("name") or f"{stack_name} page {page_idx}"
            widgets: list[str] = []
            for c in child.iter("widget"):
                name = c.get("name")
                cls = c.get("class") or ""
                if name and cls in CONTROL_CLASSES:
                    widgets.append(name)
            entry: dict = {
                "id": child.get("name") or f"{stack_name}_{page_idx}",
                "title": title,
                "widgets": widgets,
                "stacked": True,
                "stack": stack_name,
                "stack_index": page_idx,
            }
            # Desktop often keeps index 0 empty (e.g. plain ethernet); keep the page.
            if not widgets:
                entry["empty"] = True
            sections.append(entry)
            page_idx += 1
    return sections


def parse_groupbox_sections(page: ET.Element) -> list[dict]:
    """QGroupBox subgroups on a tab page: {id, title, widgets:[…], flat?, checkable?}."""
    sections: list[dict] = []
    for w in page.iter("widget"):
        if w.get("class") != "QGroupBox":
            continue
        title_el = w.find("./property[@name='title']/string")
        title = (title_el.text or "").strip() if title_el is not None else ""
        flat = _bool_prop(w, "flat")
        checkable = _bool_prop(w, "checkable")
        # Untitled QGroupBoxes are kept when they declare flat/checkable (layout chrome).
        if not title:
            if flat is None and checkable is None:
                continue
            title = (w.get("name") or "").strip() or f"Group {len(sections) + 1}"
        widgets: list[str] = []
        for child in w.iter("widget"):
            name = child.get("name")
            cls = child.get("class") or ""
            if name and cls in CONTROL_CLASSES:
                widgets.append(name)
        if not widgets:
            continue
        entry: dict[str, Any] = {
            "id": w.get("name") or f"group{len(sections)}",
            "title": title,
            "widgets": widgets,
        }
        if flat is not None:
            entry["flat"] = flat
        if checkable is not None:
            entry["checkable"] = checkable
        checked = _bool_prop(w, "checked")
        if checkable and checked is not None:
            entry["checked"] = checked
        enabled = _bool_prop(w, "enabled")
        if enabled is not None:
            entry["enabled"] = enabled
        sections.append(entry)
    return sections


def _layout_tree(node: ET.Element, *, depth: int = 0, max_depth: int = 6) -> list[dict[str, Any]]:
    """Shallow nested-layout tree under a page (structure hint, not pixel geometry)."""
    if depth > max_depth:
        return []
    out: list[dict[str, Any]] = []
    for child in list(node):
        if child.tag == "layout":
            cls = child.get("class") or "layout"
            entry: dict[str, Any] = {"class": cls, "items": len(child.findall("item"))}
            name = child.get("name")
            if name:
                entry["name"] = name
            nested = _layout_tree(child, depth=depth + 1, max_depth=max_depth)
            # Also peek into item→widget→layout
            for item in child.findall("item"):
                for w in item.findall("widget"):
                    nested.extend(_layout_tree(w, depth=depth + 1, max_depth=max_depth))
            if nested:
                entry["children"] = nested
            out.append(entry)
        elif child.tag == "widget":
            out.extend(_layout_tree(child, depth=depth, max_depth=max_depth))
    return out


def parse_pages(root: ET.Element | None) -> list[dict]:
    """Return tab pages: {id, title, widgets:[widget names], sections:[…]}."""
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
            page_tooltip = ""
            for attr in page.findall("attribute"):
                aname = attr.get("name")
                s = attr.find("string")
                text = (s.text or "").strip() if s is not None else ""
                if aname == "title":
                    title = text
                elif aname == "toolTip" and text:
                    page_tooltip = text
            widgets: list[str] = []
            for w in page.iter("widget"):
                name = w.get("name")
                cls = w.get("class") or ""
                if name and cls in CONTROL_CLASSES:
                    widgets.append(name)
            sections = parse_groupbox_sections(page) + parse_stacked_sections(page)
            page_entry: dict[str, Any] = {
                "id": page.get("name") or f"page{len(pages)}",
                "title": title or page.get("name") or f"Page {len(pages)+1}",
                "widgets": widgets,
                "sections": sections,
            }
            if page_tooltip:
                page_entry["tooltip"] = page_tooltip
            spacers = _spacers_in_subtree(page)
            if spacers:
                page_entry["spacers"] = spacers
            col_stretch = _column_stretch_in_subtree(page)
            if col_stretch:
                page_entry["column_stretch"] = col_stretch
            row_stretch = _row_stretch_in_subtree(page)
            if row_stretch:
                page_entry["row_stretch"] = row_stretch
            spacing = _grid_spacing_in_subtree(page)
            if spacing:
                page_entry["spacing"] = spacing
            layouts = _layout_summary(page)
            if layouts:
                page_entry["layouts"] = layouts
            layout_tree = _layout_tree(page)
            if layout_tree:
                page_entry["layout_tree"] = layout_tree
            annotations = _annotations_in_subtree(page)
            if annotations:
                page_entry["annotations"] = annotations
            buddy_labels = _buddy_labels_in_subtree(page)
            if buddy_labels:
                page_entry["buddy_labels"] = buddy_labels
            pages.append(page_entry)
        if pages:
            break  # primary tab widget only
    return pages


def extract_cpp(cpp_path: Path, ui_root: ET.Element | None, ui_widgets: dict[str, str]) -> dict[str, dict]:
    src = cpp_path.read_text(encoding="utf-8", errors="replace")
    labels = parse_widget_labels(ui_root)
    tips = parse_widget_tooltips(ui_root)
    whats_this = parse_widget_whats_this(ui_root)
    grid = parse_grid_positions(ui_root)
    size_policies = parse_widget_size_policies(ui_root)
    min_sizes = parse_widget_minimum_sizes(ui_root)
    max_sizes = parse_widget_maximum_sizes(ui_root)
    alignments = parse_widget_alignments(ui_root)
    enabled_map = parse_widget_enabled(ui_root)
    visible_map = parse_widget_visible(ui_root)
    readonly_map = parse_widget_readonly(ui_root)
    # Widgets that have a separate grid QLabel buddy cell (caption lives there).
    external_label_widgets: set[str] = set()
    if ui_root is not None:
        for bl in _buddy_labels_in_subtree(ui_root):
            buddy = (bl.get("buddy") or "").strip()
            if buddy:
                external_label_widgets.add(buddy)
    fields: dict[str, dict] = {}
    for m in REG_OPT.finditer(src):
        widget, key, _mapping = m.group(1), m.group(2), m.group(3)
        cls = ui_widgets.get(widget, "")
        ftype = WIDGET_TYPE.get(cls, "string")
        field: dict = {"key": key, "widget": widget, "widget_class": cls or None, "type": ftype}
        if widget in labels:
            field["label"] = labels[widget]
        if widget in external_label_widgets:
            field["external_label"] = True
        if widget in tips:
            field["tooltip"] = tips[widget]
        if widget in whats_this:
            field["whats_this"] = whats_this[widget]
        if widget in grid:
            field["grid"] = grid[widget]
        if widget in size_policies:
            field["size_policy"] = size_policies[widget]
        if widget in alignments:
            field["alignment"] = alignments[widget]
        if widget in enabled_map:
            field["enabled"] = enabled_map[widget]
        if widget in visible_map:
            field["visible"] = visible_map[widget]
        if widget in readonly_map:
            field["read_only"] = readonly_map[widget]
        if widget in min_sizes:
            field["minimum_size"] = min_sizes[widget]
        if widget in max_sizes:
            # Qt often uses 16777215 as "no limit"; skip that noise.
            mx = max_sizes[widget]
            if mx.get("width", 0) < 1000000 or mx.get("height", 0) < 1000000:
                cleaned = {
                    k: v
                    for k, v in mx.items()
                    if isinstance(v, int) and 0 < v < 1000000
                }
                if cleaned:
                    field["maximum_size"] = cleaned
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

    def keys_for_widgets(widget_names: list[str], seen: set[str] | None = None) -> list[str]:
        keys: list[str] = []
        local_seen = seen if seen is not None else set()
        for w in widget_names:
            for key in widget_to_keys.get(w, []):
                if key not in local_seen:
                    keys.append(key)
                    local_seen.add(key)
        return keys

    out = []
    for page in pages:
        seen: set[str] = set()
        keys = keys_for_widgets(page.get("widgets") or [], seen)
        sections_out: list[dict] = []
        section_seen: set[str] = set()
        for sec in page.get("sections") or []:
            sec_keys = keys_for_widgets(sec.get("widgets") or [], set())
            # Keep only keys that also belong to this page
            sec_keys = [k for k in sec_keys if k in seen]
            # Empty QStackedWidget pages (desktop index 0) stay as chrome markers.
            if not sec_keys and not (sec.get("stacked") and sec.get("empty")):
                continue
            sec_entry: dict[str, Any] = {
                "id": sec["id"],
                "title": sec["title"],
                "keys": sec_keys,
            }
            for flag in (
                "flat",
                "checkable",
                "checked",
                "enabled",
                "stacked",
                "stack",
                "stack_index",
                "empty",
            ):
                if flag in sec:
                    sec_entry[flag] = sec[flag]
            sections_out.append(sec_entry)
            section_seen.update(sec_keys)
        leftover = [k for k in keys if k not in section_seen]
        if leftover and sections_out:
            sections_out.append({"id": "other", "title": "Other", "keys": leftover})
        if keys:
            entry: dict = {"id": page["id"], "title": page["title"], "keys": keys}
            if sections_out:
                entry["sections"] = sections_out
            if page.get("tooltip"):
                entry["tooltip"] = page["tooltip"]
            if page.get("spacers"):
                entry["spacers"] = page["spacers"]
            if page.get("column_stretch"):
                entry["column_stretch"] = page["column_stretch"]
            if page.get("row_stretch"):
                entry["row_stretch"] = page["row_stretch"]
            if page.get("spacing"):
                entry["spacing"] = page["spacing"]
            if page.get("layouts"):
                entry["layouts"] = page["layouts"]
            if page.get("layout_tree"):
                entry["layout_tree"] = page["layout_tree"]
            if page.get("annotations"):
                entry["annotations"] = page["annotations"]
            if page.get("buddy_labels"):
                entry["buddy_labels"] = page["buddy_labels"]
            out.append(entry)
    return out


def parse_dialog_chrome(root: ET.Element | None) -> dict[str, Any]:
    """Top-level dialog windowTitle + geometry + tabPosition from .ui (pixel hint)."""
    out: dict[str, Any] = {}
    if root is None:
        return out
    top = root.find("widget")
    if top is None:
        return out
    title_el = top.find("./property[@name='windowTitle']/string")
    if title_el is not None and (title_el.text or "").strip():
        out["window_title"] = title_el.text.strip()
    geom = top.find("./property[@name='geometry']/rect")
    if geom is not None:
        try:
            w = int((geom.findtext("width") or "0").strip())
            h = int((geom.findtext("height") or "0").strip())
            if w > 0 and h > 0:
                out["geometry"] = {"width": w, "height": h}
        except ValueError:
            pass
    for tw in root.iter("widget"):
        if tw.get("class") != "QTabWidget":
            continue
        pos_el = tw.find("./property[@name='tabPosition']/enum")
        if pos_el is not None and (pos_el.text or "").strip():
            raw = pos_el.text.strip()
            if "::" in raw:
                raw = raw.split("::", 1)[-1]
            out["tab_position"] = raw
        break
    grip = top.find("./property[@name='sizeGripEnabled']/bool")
    if grip is not None and grip.text is not None:
        out["size_grip_enabled"] = grip.text.strip().lower() in {"true", "1"}
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
    result: dict[str, Any] = {
        "ui": ui_path.name if ui_path.is_file() else None,
        "field_count": len(fields),
        "fields": fields,
        "pages": pages,
    }
    chrome = parse_dialog_chrome(ui_root)
    result.update(chrome)
    return result


def main() -> None:
    catalog: dict[str, dict] = {
        "dialogs": {},
        "by_platform_dialog": {},
        "by_interface_dialog": {},
        "by_rule_dialog": {},
    }
    for pattern in ("*AdvancedDialog.cpp", "*IfaceOptsDialog.cpp", "*RuleOptionsDialog.cpp"):
        for cpp in sorted(LIBGUI.glob(pattern)):
            catalog["dialogs"][cpp.stem] = extract_one(cpp)

    for dlg_name, stem in DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_platform_dialog"][dlg_name] = stem
    for dlg_name, stem in IFACE_DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_interface_dialog"][dlg_name] = stem
    for dlg_name, stem in RULE_DIALOG_CPP.items():
        if stem in catalog["dialogs"]:
            catalog["by_rule_dialog"][dlg_name] = stem

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
    rule = catalog["dialogs"].get("RuleOptionsDialog", {})
    print("policy rule fields:", len(rule.get("fields") or {}), "pages:", len(rule.get("pages") or []))


if __name__ == "__main__":
    main()

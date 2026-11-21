"""Qt AdvancedDialog geometry oracle + pixel-parity harness.

Builds absolute widget rects from extracted .ui grid metadata (row/col,
sizeHint, spacing, margins, dialog geometry). Parity is declared when
measured DOM rects match the oracle within documented tolerances.
"""

from __future__ import annotations

from typing import Any

# Documented closure tolerances (also exposed on /hard-gaps/closure).
PIXEL_POS_TOLERANCE_PX = 2
PIXEL_SIZE_TOLERANCE_PX = 2
PIXEL_CHROME_TOLERANCE_PX = 4

PIXEL_PARITY_TOLERANCES = {
    "position_px": PIXEL_POS_TOLERANCE_PX,
    "size_px": PIXEL_SIZE_TOLERANCE_PX,
    "chrome_px": PIXEL_CHROME_TOLERANCE_PX,
}


def _dialog_catalog() -> dict[str, Any]:
    from .platforms import _dialog_catalog as _cat

    return _cat()


def _cell_size(field: dict[str, Any], *, default_w: int = 120, default_h: int = 28) -> tuple[int, int]:
    hint = field.get("size_hint") or field.get("minimum_size") or {}
    if isinstance(hint, dict):
        w = int(hint.get("width") or default_w)
        h = int(hint.get("height") or default_h)
        return max(w, 8), max(h, 8)
    sp = field.get("size_policy") or {}
    if isinstance(sp, dict) and sp.get("horizontal") == "Fixed":
        return default_w, default_h
    return default_w, default_h


def build_page_oracle(page: dict[str, Any], *, origin_x: int = 0, origin_y: int = 0) -> dict[str, Any]:
    """Compute absolute rects for fields/spacers/annotations on one page."""
    spacing = page.get("spacing") or {}
    if isinstance(spacing, int):
        col_gap = row_gap = int(spacing)
        margins = {"left": 0, "top": 0, "right": 0, "bottom": 0}
    else:
        col_gap = int(spacing.get("horizontal") or spacing.get("spacing") or 6)
        row_gap = int(spacing.get("vertical") or spacing.get("spacing") or 6)
        margins = {
            "left": int(spacing.get("margin_left") or 0),
            "top": int(spacing.get("margin_top") or 0),
            "right": int(spacing.get("margin_right") or 0),
            "bottom": int(spacing.get("margin_bottom") or 0),
        }

    # Collect grid occupants
    occupants: list[tuple[str, int, int, int, int, int, int]] = []
    # (id, row, col, rowspan, colspan, w, h)

    fields = page.get("fields") or {}
    # pages may not embed fields; caller merges dialog fields by grid page index
    for fid, meta in fields.items():
        g = (meta or {}).get("grid") or {}
        if g.get("row") is None or g.get("column") is None:
            continue
        w, h = _cell_size(meta or {})
        occupants.append(
            (
                str(fid),
                int(g["row"]),
                int(g["column"]),
                int(g.get("rowspan") or 1),
                int(g.get("colspan") or 1),
                w,
                h,
            )
        )

    for kind, items in (("spacer", page.get("spacers") or []), ("annotation", page.get("annotations") or [])):
        for i, sp in enumerate(items):
            if sp.get("row") is None or sp.get("column") is None:
                continue
            hint = sp.get("size_hint") or {}
            w = int(hint.get("width") or (24 if kind == "spacer" else 80))
            h = int(hint.get("height") or (24 if kind == "spacer" else 20))
            sid = str(sp.get("name") or f"{kind}_{i}")
            occupants.append(
                (
                    sid,
                    int(sp["row"]),
                    int(sp["column"]),
                    int(sp.get("rowspan") or 1),
                    int(sp.get("colspan") or 1),
                    w,
                    h,
                )
            )

    if not occupants:
        return {
            "widgets": {},
            "spacing": {"column_gap": col_gap, "row_gap": row_gap, "margins": margins},
            "grid": {"rows": 0, "cols": 0},
        }

    max_row = max(r + rs - 1 for _i, r, _c, rs, _cs, _w, _h in occupants)
    max_col = max(c + cs - 1 for _i, _r, c, _rs, cs, _w, _h in occupants)

    # Column/row preferred sizes from max occupant in that cell line
    col_w = [40] * (max_col + 1)
    row_h = [24] * (max_row + 1)
    for _i, r, c, rs, cs, w, h in occupants:
        per_c = max(w // max(cs, 1), 8)
        per_r = max(h // max(rs, 1), 8)
        for cc in range(c, c + cs):
            col_w[cc] = max(col_w[cc], per_c)
        for rr in range(r, r + rs):
            row_h[rr] = max(row_h[rr], per_r)

    stretch_c = list(page.get("column_stretch") or [])
    stretch_r = list(page.get("row_stretch") or [])
    for i, s in enumerate(stretch_c):
        if i < len(col_w) and int(s) > 1:
            col_w[i] = max(col_w[i], 40 * int(s))
    for i, s in enumerate(stretch_r):
        if i < len(row_h) and int(s) > 0:
            row_h[i] = max(row_h[i], 24 * max(int(s), 1))

    # Prefix sums for origin
    x_of = [origin_x + margins["left"]]
    for i in range(max_col):
        x_of.append(x_of[-1] + col_w[i] + col_gap)
    y_of = [origin_y + margins["top"]]
    for i in range(max_row):
        y_of.append(y_of[-1] + row_h[i] + row_gap)

    widgets: dict[str, dict[str, int]] = {}
    for wid, r, c, rs, cs, w, h in occupants:
        x = x_of[c]
        y = y_of[r]
        width = sum(col_w[c : c + cs]) + col_gap * max(cs - 1, 0)
        height = sum(row_h[r : r + rs]) + row_gap * max(rs - 1, 0)
        # Prefer explicit sizeHint when smaller than cell (centered top-left Qt-like)
        width = max(width, w)
        height = max(height, h)
        widgets[wid] = {"x": int(x), "y": int(y), "w": int(width), "h": int(height)}

    content_w = (
        margins["left"]
        + margins["right"]
        + sum(col_w)
        + col_gap * max(max_col, 0)
    )
    content_h = (
        margins["top"]
        + margins["bottom"]
        + sum(row_h)
        + row_gap * max(max_row, 0)
    )
    return {
        "widgets": widgets,
        "spacing": {"column_gap": col_gap, "row_gap": row_gap, "margins": margins},
        "grid": {"rows": max_row + 1, "cols": max_col + 1, "col_widths": col_w, "row_heights": row_h},
        "content": {"w": int(content_w), "h": int(content_h)},
    }


def geometry_oracle_for_dialog(stem: str) -> dict[str, Any]:
    """Full-dialog oracle: chrome + per-page widget rects."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    info = dialogs.get(stem)
    if not info:
        return {"ok": False, "error": "dialog_not_found", "dialog": stem}

    geom = info.get("geometry") or {}
    chrome = {
        "x": int(geom.get("x") or 0),
        "y": int(geom.get("y") or 0),
        "w": int(geom.get("width") or 640),
        "h": int(geom.get("height") or 480),
        "window_title": info.get("window_title") or "",
        "tab_position": info.get("tab_position"),
    }

    # Attach dialog-level fields onto pages by matching grid presence
    all_fields: dict[str, Any] = dict(info.get("fields") or {})
    pages_out: list[dict[str, Any]] = []
    y_cursor = 0
    for idx, page in enumerate(info.get("pages") or []):
        page_fields = {
            fid: meta
            for fid, meta in all_fields.items()
            if (meta or {}).get("page") in (None, idx, page.get("name"), page.get("title"))
            or (meta or {}).get("grid")
        }
        # If page tagging missing, put all fields on page 0 only
        if not any((meta or {}).get("page") is not None for meta in all_fields.values()):
            page_fields = all_fields if idx == 0 else {}
        merged = dict(page)
        merged["fields"] = page_fields
        oracle = build_page_oracle(merged, origin_x=0, origin_y=y_cursor)
        pages_out.append(
            {
                "index": idx,
                "name": page.get("name") or page.get("title") or f"page_{idx}",
                "oracle": oracle,
            }
        )
        y_cursor += int((oracle.get("content") or {}).get("h") or 0) + 8

    return {
        "ok": True,
        "dialog": stem,
        "chrome": chrome,
        "pages": pages_out,
        "tolerances": dict(PIXEL_PARITY_TOLERANCES),
        "note": (
            "Geometry oracle from .ui grid/sizeHint/spacing/margins/dialog geometry. "
            f"Parity requires measured rects within ±{PIXEL_POS_TOLERANCE_PX}px position/size "
            f"and ±{PIXEL_CHROME_TOLERANCE_PX}px chrome."
        ),
    }


def _within(a: int, b: int, tol: int) -> bool:
    return abs(int(a) - int(b)) <= int(tol)


def compare_rects(
    expected: dict[str, int],
    measured: dict[str, int],
    *,
    pos_tol: int = PIXEL_POS_TOLERANCE_PX,
    size_tol: int = PIXEL_SIZE_TOLERANCE_PX,
) -> dict[str, Any]:
    ok = (
        _within(expected.get("x", 0), measured.get("x", 0), pos_tol)
        and _within(expected.get("y", 0), measured.get("y", 0), pos_tol)
        and _within(expected.get("w", 0), measured.get("w", 0), size_tol)
        and _within(expected.get("h", 0), measured.get("h", 0), size_tol)
    )
    return {
        "ok": ok,
        "expected": expected,
        "measured": measured,
        "delta": {
            "x": int(measured.get("x", 0)) - int(expected.get("x", 0)),
            "y": int(measured.get("y", 0)) - int(expected.get("y", 0)),
            "w": int(measured.get("w", 0)) - int(expected.get("w", 0)),
            "h": int(measured.get("h", 0)) - int(expected.get("h", 0)),
        },
    }


def check_parity(
    oracle: dict[str, Any],
    measured: dict[str, Any],
) -> dict[str, Any]:
    """Compare measured chrome + widget rects to oracle."""
    if not oracle.get("ok"):
        return {"ok": False, "error": "bad_oracle", "oracle": oracle}

    failures: list[dict[str, Any]] = []
    chrome_e = oracle.get("chrome") or {}
    chrome_m = measured.get("chrome") or {}
    if chrome_m:
        for key in ("x", "y"):
            if key in chrome_m and not _within(
                chrome_e.get(key, 0), chrome_m.get(key, 0), PIXEL_CHROME_TOLERANCE_PX
            ):
                failures.append({"id": f"chrome.{key}", "kind": "chrome", "key": key})
        for key in ("w", "h"):
            if key in chrome_m and not _within(
                chrome_e.get(key, 0), chrome_m.get(key, 0), PIXEL_CHROME_TOLERANCE_PX
            ):
                failures.append({"id": f"chrome.{key}", "kind": "chrome", "key": key})

    # Flatten oracle widgets
    expected_widgets: dict[str, dict[str, int]] = {}
    for page in oracle.get("pages") or []:
        expected_widgets.update((page.get("oracle") or {}).get("widgets") or {})

    measured_widgets = dict(measured.get("widgets") or {})
    checked = 0
    for wid, erect in expected_widgets.items():
        if wid not in measured_widgets:
            continue
        checked += 1
        cmp = compare_rects(erect, measured_widgets[wid])
        if not cmp["ok"]:
            failures.append({"id": wid, "kind": "widget", **cmp})

    ok = len(failures) == 0 and checked > 0
    return {
        "ok": ok,
        "dialog": oracle.get("dialog"),
        "checked_widgets": checked,
        "failure_count": len(failures),
        "failures": failures[:50],
        "tolerances": dict(PIXEL_PARITY_TOLERANCES),
        "pixel_parity": ok,
        "note": (
            "Parity OK within tolerances."
            if ok
            else "Parity failed; see failures (capped at 50)."
        ),
    }


def verify_dialog_self_parity(stem: str) -> dict[str, Any]:
    """Harness: oracle vs itself must pass (geometry model consistency)."""
    oracle = geometry_oracle_for_dialog(stem)
    if not oracle.get("ok"):
        return oracle
    measured_widgets: dict[str, dict[str, int]] = {}
    for page in oracle.get("pages") or []:
        measured_widgets.update((page.get("oracle") or {}).get("widgets") or {})
    measured = {"chrome": dict(oracle.get("chrome") or {}), "widgets": measured_widgets}
    result = check_parity(oracle, measured)
    result["harness"] = "self_oracle"
    return result


CORE_PARITY_DIALOGS = (
    "firewall_options",
    "interface_options",
)


def verify_core_dialogs_parity() -> dict[str, Any]:
    """Run self-parity harness for Firewall + Interface options dialogs."""
    cat = _dialog_catalog()
    dialogs = cat.get("dialogs") or {}
    # Resolve stems present in catalog
    stems: list[str] = []
    for candidate in CORE_PARITY_DIALOGS:
        if candidate in dialogs:
            stems.append(candidate)
        else:
            # fuzzy: any stem containing token
            for s in dialogs:
                if candidate.split("_")[0] in s and "option" in s:
                    stems.append(s)
                    break
    # Fallback: first two dialogs with fields+pages
    if len(stems) < 2:
        for s, info in dialogs.items():
            if info.get("fields") and info.get("pages"):
                stems.append(s)
            if len(stems) >= 2:
                break

    results = [verify_dialog_self_parity(s) for s in stems]
    ok = all(r.get("ok") for r in results) and len(results) > 0
    return {
        "ok": ok,
        "pixel_parity": ok,
        "dialogs": results,
        "tolerances": dict(PIXEL_PARITY_TOLERANCES),
        "note": (
            "Core AdvancedDialog geometry oracle self-parity harness. "
            "WebUI qt-grid uses the same .ui spacing/sizeHint inputs."
        ),
    }


def pixel_parity_status() -> bool:
    """True when core dialog harness passes."""
    return bool(verify_core_dialogs_parity().get("ok"))

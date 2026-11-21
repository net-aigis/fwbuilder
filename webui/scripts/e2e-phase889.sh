#!/usr/bin/env bash
# Phase-889: pages/sections/stack_names hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert (f.get("pages") or {}).get("pages", 0) > 0
assert (f.get("pages") or {}).get("sections", 0) > 0
assert isinstance((f.get("pages") or {}).get("stack_names"), list)
assert len(f["pages"]["stack_names"]) > 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_pages") == f["pages"]["pages"]
assert h.get("layout_fidelity_sample_sections") == f["pages"]["sections"]
assert h.get("layout_fidelity_sample_stack_names") == f["pages"]["stack_names"]
assert h.get("layout_fidelity_sample_stack_names_count") == len(f["pages"]["stack_names"])
assert s.get("layout_fidelity_sample_pages") == f["pages"]["pages"]
assert s.get("layout_fidelity_sample_stack_names_count") == len(f["pages"]["stack_names"])
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "pages/sections/stack_names" in note or "stack_names" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 896
print("pages", f["pages"]["pages"], "sections", f["pages"]["sections"], "stacks", f["pages"]["stack_names"])
PY
echo "cleaned"
echo "OK: phase889 e2e passed"

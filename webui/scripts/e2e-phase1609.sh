#!/usr/bin/env bash
# Phase-1609: soft_fertig_honesty_bundle_sections on hard-gaps (+ summary/closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS) >= 7
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
secs = h.get("soft_fertig_honesty_bundle_sections") or []
assert secs == list(m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS)
assert h.get("soft_fertig_honesty_bundle_section_count") == len(secs)
assert set(h.get("soft_fertig_honesty_bundle_section_titles") or {}) == set(secs)
assert h.get("soft_fertig_honesty_bundle_notes_count") == len(secs)
assert s.get("soft_fertig_honesty_bundle_section_count") == len(secs)
assert c.get("soft_fertig_honesty_bundle_sections") == secs
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1616
print("honesty bundle sections", secs)
PY
echo "cleaned"
echo "OK: phase1609 e2e passed"

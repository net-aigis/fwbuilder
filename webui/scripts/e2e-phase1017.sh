#!/usr/bin/env bash
# Phase-1017: with_read_only hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert "with_read_only" in f["fields"]
assert isinstance(f["fields"]["with_read_only"], int)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_read_only") == f["fields"]["with_read_only"]
assert s.get("layout_fidelity_sample_with_read_only") == f["fields"]["with_read_only"]
assert isinstance(h.get("layout_fidelity_sample_with_read_only"), int)
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "with_read_only" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1024
print("with_read_only", f["fields"]["with_read_only"], "keys", h.get("layout_fidelity_sample_key_count"))
PY
echo "cleaned"
echo "OK: phase1017 e2e passed"

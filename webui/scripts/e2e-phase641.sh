#!/usr/bin/env bash
# Phase-641: /hard-gaps carries layout_fidelity sample (not pixel).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert h.get("layout_fidelity_pixel_parity") is False
assert isinstance(h.get("layout_fidelity_sample_score_percent"), (int, float))
assert h.get("layout_fidelity_sample_platform") == "iptables"
s = m.hard_gaps_summary()
assert h["layout_fidelity_sample_score_percent"] == s["layout_fidelity_sample_score_percent"]
assert m.WEBUI_SOFT_COMPLETE_PHASE == "648"
print("hard-gaps sample fidelity", h["layout_fidelity_sample_score_percent"])
PY
echo "cleaned"
echo "OK: phase641 e2e passed"

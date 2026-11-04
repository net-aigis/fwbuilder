#!/usr/bin/env bash
# Phase-633: summary includes layout_fidelity sample score (not pixel).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
s = m.hard_gaps_summary()
assert s.get("layout_fidelity_pixel_parity") is False
assert isinstance(s.get("layout_fidelity_sample_score_percent"), (int, float))
assert isinstance(s.get("layout_fidelity_sample_score_parts_count"), int)
assert s.get("layout_fidelity_sample_platform") == "iptables"
assert s.get("layout_fidelity_path") == "/api/v1/layout-fidelity"
assert m.WEBUI_SOFT_COMPLETE_PHASE == "640"
print("summary fidelity sample", s["layout_fidelity_sample_score_percent"])
PY
echo "cleaned"
echo "OK: phase633 e2e passed"

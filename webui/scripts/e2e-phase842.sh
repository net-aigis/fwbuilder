#!/usr/bin/env bash
# Phase-842: hard-gaps sample still mirrors min/max size after score weight.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_with_minimum_size") == f["fields"]["with_minimum_size"]
assert h.get("layout_fidelity_sample_with_maximum_size") == f["fields"]["with_maximum_size"]
assert s.get("layout_fidelity_sample_score_parts_count") == f["score_parts_count"]
print("sample parts", s["layout_fidelity_sample_score_parts_count"])
PY
echo "cleaned"
echo "OK: phase842 e2e passed"

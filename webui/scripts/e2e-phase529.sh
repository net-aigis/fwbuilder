#!/usr/bin/env bash
# Phase-529: score includes with_whats_this / with_tooltip / tab_position.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'field_stats["with_whats_this"]' webui/backend/fwbweb_api/platforms.py
grep -Fq 'field_stats["with_tooltip"]' webui/backend/fwbweb_api/platforms.py
grep -Fq 'chrome["tab_position"]' webui/backend/fwbweb_api/platforms.py
grep -Fq 'pages_with_tooltip' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r = layout_fidelity_for("iptables", "linux24")
assert r["ok"] and r["score_percent"] is not None
print("enriched score", r["score_percent"])
PY
echo "cleaned"
echo "OK: phase529 e2e passed"

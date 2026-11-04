#!/usr/bin/env bash
# Phase-537: score_parts_count + enabled/alignment weights.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'score_parts_count' webui/backend/fwbweb_api/platforms.py
grep -Fq 'with_enabled' webui/backend/fwbweb_api/platforms.py
grep -Fq 'score_parts_count across phases' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for, option_schema
r = layout_fidelity_for("iptables", "linux24")
assert r.get("score_parts_count", 0) >= 17
osch = option_schema("iptables", "linux24")
assert (osch.get("layout_fidelity") or {}).get("score_parts_count") == r["score_parts_count"]
print("score_parts_count", r["score_parts_count"], "score", r["score_percent"])
PY
echo "cleaned"
echo "OK: phase537 e2e passed"

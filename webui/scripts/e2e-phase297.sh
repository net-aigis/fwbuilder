#!/usr/bin/env bash
# Phase-297: layout_fidelity_for + GET /layout-fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_for' webui/backend/fwbweb_api/platforms.py
grep -Fq 'layout-fidelity' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r=layout_fidelity_for("iptables")
assert r["ok"] and r["pixel_parity"] is False
assert r["score_percent"] > 0
assert r["fields"]["with_grid"] > 0
print("fidelity ok", r["dialog"], r["score_percent"])
print("cleaned")
PY
echo "OK: phase297 e2e passed"

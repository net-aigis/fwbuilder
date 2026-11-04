#!/usr/bin/env bash
# Phase-1183: e2e-all lists 1177-1184; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1177 1178 1179 1180 1181 1182 1183 1184; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1177-1184 ok"
echo "cleaned"
echo "OK: phase1183 e2e passed"

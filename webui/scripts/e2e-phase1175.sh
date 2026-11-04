#!/usr/bin/env bash
# Phase-1175: e2e-all lists 1169-1176; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1169 1170 1171 1172 1173 1174 1175 1176; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1169-1176 ok"
echo "cleaned"
echo "OK: phase1175 e2e passed"

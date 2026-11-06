#!/usr/bin/env bash
# Phase-4079: e2e-all lists 4073-4080; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4073 4074 4075 4076 4077 4078 4079 4080; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4073-4080 ok"
echo "cleaned"
echo "OK: phase4079 e2e passed"

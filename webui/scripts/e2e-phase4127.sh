#!/usr/bin/env bash
# Phase-4127: e2e-all lists 4121-4128; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4121 4122 4123 4124 4125 4126 4127 4128; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4121-4128 ok"
echo "cleaned"
echo "OK: phase4127 e2e passed"

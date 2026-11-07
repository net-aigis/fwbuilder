#!/usr/bin/env bash
# Phase-4183: e2e-all lists 4177-4184; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4177 4178 4179 4180 4181 4182 4183 4184; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4177-4184 ok"
echo "cleaned"
echo "OK: phase4183 e2e passed"

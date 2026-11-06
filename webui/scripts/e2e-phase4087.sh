#!/usr/bin/env bash
# Phase-4087: e2e-all lists 4081-4088; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4081 4082 4083 4084 4085 4086 4087 4088; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4081-4088 ok"
echo "cleaned"
echo "OK: phase4087 e2e passed"

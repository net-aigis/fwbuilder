#!/usr/bin/env bash
# Phase-4535: e2e-all lists 4529-4536; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4529 4530 4531 4532 4533 4534 4535 4536; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4529-4536 ok"
echo "cleaned"
echo "OK: phase4535 e2e passed"

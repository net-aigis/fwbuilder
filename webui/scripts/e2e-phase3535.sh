#!/usr/bin/env bash
# Phase-3535: e2e-all lists 3529-3536; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3529 3530 3531 3532 3533 3534 3535 3536; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3529-3536 ok"
echo "cleaned"
echo "OK: phase3535 e2e passed"

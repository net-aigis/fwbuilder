#!/usr/bin/env bash
# Phase-3951: e2e-all lists 3945-3952; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3945 3946 3947 3948 3949 3950 3951 3952; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3945-3952 ok"
echo "cleaned"
echo "OK: phase3951 e2e passed"

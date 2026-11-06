#!/usr/bin/env bash
# Phase-3911: e2e-all lists 3905-3912; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3905 3906 3907 3908 3909 3910 3911 3912; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3905-3912 ok"
echo "cleaned"
echo "OK: phase3911 e2e passed"

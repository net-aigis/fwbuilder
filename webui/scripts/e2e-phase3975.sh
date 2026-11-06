#!/usr/bin/env bash
# Phase-3975: e2e-all lists 3969-3976; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3969 3970 3971 3972 3973 3974 3975 3976; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3969-3976 ok"
echo "cleaned"
echo "OK: phase3975 e2e passed"

#!/usr/bin/env bash
# Phase-4255: e2e-all lists 4249-4256; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4249 4250 4251 4252 4253 4254 4255 4256; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4249-4256 ok"
echo "cleaned"
echo "OK: phase4255 e2e passed"

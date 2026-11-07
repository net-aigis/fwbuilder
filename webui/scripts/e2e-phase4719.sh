#!/usr/bin/env bash
# Phase-4719: e2e-all lists 4713-4720; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4713 4714 4715 4716 4717 4718 4719 4720; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4713-4720 ok"
echo "cleaned"
echo "OK: phase4719 e2e passed"

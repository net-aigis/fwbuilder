#!/usr/bin/env bash
# Phase-1719: e2e-all lists 1713-1720; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1713 1714 1715 1716 1717 1718 1719 1720; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1713-1720 ok"
echo "cleaned"
echo "OK: phase1719 e2e passed"

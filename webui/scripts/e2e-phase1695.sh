#!/usr/bin/env bash
# Phase-1695: e2e-all lists 1689-1696; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1689 1690 1691 1692 1693 1694 1695 1696; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1689-1696 ok"
echo "cleaned"
echo "OK: phase1695 e2e passed"

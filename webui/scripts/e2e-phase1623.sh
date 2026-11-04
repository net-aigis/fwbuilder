#!/usr/bin/env bash
# Phase-1623: e2e-all lists 1617-1624; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1617 1618 1619 1620 1621 1622 1623 1624; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1617-1624 ok"
echo "cleaned"
echo "OK: phase1623 e2e passed"

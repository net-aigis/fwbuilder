#!/usr/bin/env bash
# Phase-1631: e2e-all lists 1625-1632; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1625 1626 1627 1628 1629 1630 1631 1632; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1625-1632 ok"
echo "cleaned"
echo "OK: phase1631 e2e passed"

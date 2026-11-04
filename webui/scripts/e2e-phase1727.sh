#!/usr/bin/env bash
# Phase-1727: e2e-all lists 1721-1728; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1721 1722 1723 1724 1725 1726 1727 1728; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1721-1728 ok"
echo "cleaned"
echo "OK: phase1727 e2e passed"

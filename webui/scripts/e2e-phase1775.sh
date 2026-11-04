#!/usr/bin/env bash
# Phase-1775: e2e-all lists 1769-1776; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1769 1770 1771 1772 1773 1774 1775 1776; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1769-1776 ok"
echo "cleaned"
echo "OK: phase1775 e2e passed"

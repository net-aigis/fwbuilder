#!/usr/bin/env bash
# Phase-1767: e2e-all lists 1761-1768; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1761 1762 1763 1764 1765 1766 1767 1768; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1761-1768 ok"
echo "cleaned"
echo "OK: phase1767 e2e passed"

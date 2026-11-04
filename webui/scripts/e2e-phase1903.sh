#!/usr/bin/env bash
# Phase-1903: e2e-all lists 1897-1904; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1897 1898 1899 1900 1901 1902 1903 1904; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1897-1904 ok"
echo "cleaned"
echo "OK: phase1903 e2e passed"

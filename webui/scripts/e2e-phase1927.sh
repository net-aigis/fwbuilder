#!/usr/bin/env bash
# Phase-1927: e2e-all lists 1921-1928; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1921 1922 1923 1924 1925 1926 1927 1928; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1921-1928 ok"
echo "cleaned"
echo "OK: phase1927 e2e passed"

#!/usr/bin/env bash
# Phase-1943: e2e-all lists 1937-1944; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1937 1938 1939 1940 1941 1942 1943 1944; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1937-1944 ok"
echo "cleaned"
echo "OK: phase1943 e2e passed"

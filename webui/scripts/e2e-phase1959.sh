#!/usr/bin/env bash
# Phase-1959: e2e-all lists 1953-1960; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1953 1954 1955 1956 1957 1958 1959 1960; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1953-1960 ok"
echo "cleaned"
echo "OK: phase1959 e2e passed"

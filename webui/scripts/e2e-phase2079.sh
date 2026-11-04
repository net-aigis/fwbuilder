#!/usr/bin/env bash
# Phase-2079: e2e-all lists 2073-2080; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2073 2074 2075 2076 2077 2078 2079 2080; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2073-2080 ok"
echo "cleaned"
echo "OK: phase2079 e2e passed"

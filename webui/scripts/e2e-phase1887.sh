#!/usr/bin/env bash
# Phase-1887: e2e-all lists 1881-1888; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1881 1882 1883 1884 1885 1886 1887 1888; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1881-1888 ok"
echo "cleaned"
echo "OK: phase1887 e2e passed"

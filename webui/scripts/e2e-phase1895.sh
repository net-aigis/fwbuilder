#!/usr/bin/env bash
# Phase-1895: e2e-all lists 1889-1896; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1889 1890 1891 1892 1893 1894 1895 1896; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1889-1896 ok"
echo "cleaned"
echo "OK: phase1895 e2e passed"

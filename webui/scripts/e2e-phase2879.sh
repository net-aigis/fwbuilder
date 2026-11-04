#!/usr/bin/env bash
# Phase-2879: e2e-all lists 2873-2880; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2873 2874 2875 2876 2877 2878 2879 2880; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2873-2880 ok"
echo "cleaned"
echo "OK: phase2879 e2e passed"

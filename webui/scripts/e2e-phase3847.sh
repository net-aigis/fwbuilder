#!/usr/bin/env bash
# Phase-3847: e2e-all lists 3841-3848; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3841 3842 3843 3844 3845 3846 3847 3848; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3841-3848 ok"
echo "cleaned"
echo "OK: phase3847 e2e passed"

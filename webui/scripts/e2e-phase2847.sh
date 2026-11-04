#!/usr/bin/env bash
# Phase-2847: e2e-all lists 2841-2848; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2841 2842 2843 2844 2845 2846 2847 2848; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2841-2848 ok"
echo "cleaned"
echo "OK: phase2847 e2e passed"

#!/usr/bin/env bash
# Phase-2831: e2e-all lists 2825-2832; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2825 2826 2827 2828 2829 2830 2831 2832; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2825-2832 ok"
echo "cleaned"
echo "OK: phase2831 e2e passed"

#!/usr/bin/env bash
# Phase-2695: e2e-all lists 2689-2696; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2689 2690 2691 2692 2693 2694 2695 2696; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2689-2696 ok"
echo "cleaned"
echo "OK: phase2695 e2e passed"

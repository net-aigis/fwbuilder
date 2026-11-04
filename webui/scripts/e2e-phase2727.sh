#!/usr/bin/env bash
# Phase-2727: e2e-all lists 2721-2728; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2721 2722 2723 2724 2725 2726 2727 2728; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2721-2728 ok"
echo "cleaned"
echo "OK: phase2727 e2e passed"

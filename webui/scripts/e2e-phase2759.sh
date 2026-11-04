#!/usr/bin/env bash
# Phase-2759: e2e-all lists 2753-2760; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2753 2754 2755 2756 2757 2758 2759 2760; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2753-2760 ok"
echo "cleaned"
echo "OK: phase2759 e2e passed"

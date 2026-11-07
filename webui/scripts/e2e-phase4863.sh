#!/usr/bin/env bash
# Phase-4863: e2e-all lists 4857-4864; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4857 4858 4859 4860 4861 4862 4863 4864; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4857-4864 ok"; echo "cleaned"; echo "OK: phase4863 e2e passed"

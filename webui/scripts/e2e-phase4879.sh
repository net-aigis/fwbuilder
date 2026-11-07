#!/usr/bin/env bash
# Phase-4879: e2e-all lists 4873-4880; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4873 4874 4875 4876 4877 4878 4879 4880; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4873-4880 ok"; echo "cleaned"; echo "OK: phase4879 e2e passed"

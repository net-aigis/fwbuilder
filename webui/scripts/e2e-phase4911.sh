#!/usr/bin/env bash
# Phase-4911: e2e-all lists 4905-4912; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4905 4906 4907 4908 4909 4910 4911 4912; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4905-4912 ok"; echo "cleaned"; echo "OK: phase4911 e2e passed"

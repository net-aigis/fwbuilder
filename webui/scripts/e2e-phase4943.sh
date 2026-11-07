#!/usr/bin/env bash
# Phase-4943: e2e-all lists 4937-4944; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4937 4938 4939 4940 4941 4942 4943 4944; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4937-4944 ok"; echo "cleaned"; echo "OK: phase4943 e2e passed"

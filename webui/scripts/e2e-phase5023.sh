#!/usr/bin/env bash
# Phase-5023: e2e-all lists 5017-5024; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5017 5018 5019 5020 5021 5022 5023 5024; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5017-5024 ok"; echo "cleaned"; echo "OK: phase5023 e2e passed"

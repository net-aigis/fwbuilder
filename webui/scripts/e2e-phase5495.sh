#!/usr/bin/env bash
# Phase-5495: e2e-all lists 5409-5416; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5409 5410 5411 5412 5413 5414 5415 5416; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5409-5416 ok"; echo "cleaned"; echo "OK: phase5495 e2e passed"

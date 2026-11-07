#!/usr/bin/env bash
# Phase-5079: e2e-all lists 5073-5080; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5073 5074 5075 5076 5077 5078 5079 5080; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5073-5080 ok"; echo "cleaned"; echo "OK: phase5079 e2e passed"

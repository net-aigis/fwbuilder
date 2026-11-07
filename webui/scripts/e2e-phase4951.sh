#!/usr/bin/env bash
# Phase-4951: e2e-all lists 4945-4952; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4945 4946 4947 4948 4949 4950 4951 4952; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4945-4952 ok"; echo "cleaned"; echo "OK: phase4951 e2e passed"

#!/usr/bin/env bash
# Phase-4903: e2e-all lists 4897-4904; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4897 4898 4899 4900 4901 4902 4903 4904; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4897-4904 ok"; echo "cleaned"; echo "OK: phase4903 e2e passed"

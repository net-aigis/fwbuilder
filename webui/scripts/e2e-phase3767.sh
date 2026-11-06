#!/usr/bin/env bash
# Phase-3767: e2e-all lists 3761-3768; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3761 3762 3763 3764 3765 3766 3767 3768; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3761-3768 ok"
echo "cleaned"
echo "OK: phase3767 e2e passed"

#!/usr/bin/env bash
# Phase-3743: e2e-all lists 3737-3744; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3737 3738 3739 3740 3741 3742 3743 3744; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3737-3744 ok"
echo "cleaned"
echo "OK: phase3743 e2e passed"

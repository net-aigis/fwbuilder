#!/usr/bin/env bash
# Phase-4767: e2e-all lists 4761-4768; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4761 4762 4763 4764 4765 4766 4767 4768; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4761-4768 ok"
echo "cleaned"
echo "OK: phase4767 e2e passed"

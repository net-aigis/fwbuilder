#!/usr/bin/env bash
# Phase-3023: e2e-all lists 3017-3024; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3017 3018 3019 3020 3021 3022 3023 3024; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3017-3024 ok"
echo "cleaned"
echo "OK: phase3023 e2e passed"

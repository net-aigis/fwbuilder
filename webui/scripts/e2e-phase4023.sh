#!/usr/bin/env bash
# Phase-4023: e2e-all lists 4017-4024; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4017 4018 4019 4020 4021 4022 4023 4024; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4017-4024 ok"
echo "cleaned"
echo "OK: phase4023 e2e passed"

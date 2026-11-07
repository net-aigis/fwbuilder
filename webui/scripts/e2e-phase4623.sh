#!/usr/bin/env bash
# Phase-4623: e2e-all lists 4617-4624; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4617 4618 4619 4620 4621 4622 4623 4624; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4617-4624 ok"
echo "cleaned"
echo "OK: phase4623 e2e passed"

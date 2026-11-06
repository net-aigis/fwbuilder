#!/usr/bin/env bash
# Phase-3623: e2e-all lists 3617-3624; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3617 3618 3619 3620 3621 3622 3623 3624; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3617-3624 ok"
echo "cleaned"
echo "OK: phase3623 e2e passed"

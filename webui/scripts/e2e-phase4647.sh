#!/usr/bin/env bash
# Phase-4647: e2e-all lists 4641-4648; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4641 4642 4643 4644 4645 4646 4647 4648; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4641-4648 ok"
echo "cleaned"
echo "OK: phase4647 e2e passed"

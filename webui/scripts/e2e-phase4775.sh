#!/usr/bin/env bash
# Phase-4775: e2e-all lists 4769-4776; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4769 4770 4771 4772 4773 4774 4775 4776; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4769-4776 ok"
echo "cleaned"
echo "OK: phase4775 e2e passed"

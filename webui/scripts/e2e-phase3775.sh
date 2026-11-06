#!/usr/bin/env bash
# Phase-3775: e2e-all lists 3769-3776; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3769 3770 3771 3772 3773 3774 3775 3776; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3769-3776 ok"
echo "cleaned"
echo "OK: phase3775 e2e passed"

#!/usr/bin/env bash
# Phase-3863: e2e-all lists 3857-3864; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3857 3858 3859 3860 3861 3862 3863 3864; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3857-3864 ok"
echo "cleaned"
echo "OK: phase3863 e2e passed"

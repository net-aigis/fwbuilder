#!/usr/bin/env bash
# Phase-2087: e2e-all lists 2081-2088; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2081 2082 2083 2084 2085 2086 2087 2088; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2081-2088 ok"
echo "cleaned"
echo "OK: phase2087 e2e passed"

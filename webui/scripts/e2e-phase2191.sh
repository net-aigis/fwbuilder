#!/usr/bin/env bash
# Phase-2191: e2e-all lists 2185-2192; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2185 2186 2187 2188 2189 2190 2191 2192; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2185-2192 ok"
echo "cleaned"
echo "OK: phase2191 e2e passed"

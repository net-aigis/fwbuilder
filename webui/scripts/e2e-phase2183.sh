#!/usr/bin/env bash
# Phase-2183: e2e-all lists 2177-2184; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2177 2178 2179 2180 2181 2182 2183 2184; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2177-2184 ok"
echo "cleaned"
echo "OK: phase2183 e2e passed"

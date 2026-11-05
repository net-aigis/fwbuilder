#!/usr/bin/env bash
# Phase-2991: e2e-all lists 2985-2992; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2985 2986 2987 2988 2989 2990 2991 2992; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2985-2992 ok"
echo "cleaned"
echo "OK: phase2991 e2e passed"

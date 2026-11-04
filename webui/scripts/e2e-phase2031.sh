#!/usr/bin/env bash
# Phase-2031: e2e-all lists 2025-2032; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2025 2026 2027 2028 2029 2030 2031 2032; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2025-2032 ok"
echo "cleaned"
echo "OK: phase2031 e2e passed"

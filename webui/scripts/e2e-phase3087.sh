#!/usr/bin/env bash
# Phase-3087: e2e-all lists 3081-3088; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3081 3082 3083 3084 3085 3086 3087 3088; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3081-3088 ok"
echo "cleaned"
echo "OK: phase3087 e2e passed"

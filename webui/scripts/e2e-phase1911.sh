#!/usr/bin/env bash
# Phase-1911: e2e-all lists 1905-1912; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1905 1906 1907 1908 1909 1910 1911 1912; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1905-1912 ok"
echo "cleaned"
echo "OK: phase1911 e2e passed"

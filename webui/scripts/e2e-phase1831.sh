#!/usr/bin/env bash
# Phase-1831: e2e-all lists 1825-1832; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1825 1826 1827 1828 1829 1830 1831 1832; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1825-1832 ok"
echo "cleaned"
echo "OK: phase1831 e2e passed"

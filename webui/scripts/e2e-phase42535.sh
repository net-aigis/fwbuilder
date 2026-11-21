#!/usr/bin/env bash
# Phase-42535: e2e-all 42529-42536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 42529 42530 42531 42532 42533 42534 42535 42536; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==0
PY
echo OK: phase42535

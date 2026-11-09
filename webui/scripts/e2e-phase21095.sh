#!/usr/bin/env bash
# Phase-21095: e2e-all 21089-21096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 21089 21090 21091 21092 21093 21094 21095 21096; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY
echo OK: phase21095

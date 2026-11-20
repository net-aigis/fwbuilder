#!/usr/bin/env bash
# Phase-34615: e2e-all 34609-34616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 34609 34610 34611 34612 34613 34614 34615 34616; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY
echo OK: phase34615

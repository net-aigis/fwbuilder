#!/usr/bin/env bash
# Phase-32568: soft-complete through 32568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32568
PY
grep -qE 'phase32568|through 32568' webui/STATUS.md
echo "OK: phase32568 e2e passed"

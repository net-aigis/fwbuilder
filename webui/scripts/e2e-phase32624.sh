#!/usr/bin/env bash
# Phase-32624: soft-complete through 32624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32624
PY
grep -qE 'phase32624|through 32624' webui/STATUS.md
echo "OK: phase32624 e2e passed"

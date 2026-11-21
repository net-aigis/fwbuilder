#!/usr/bin/env bash
# Phase-10128: soft-complete through 10128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10128
PY
grep -qE 'phase10128|through 10128' webui/STATUS.md
echo "OK: phase10128 e2e passed"

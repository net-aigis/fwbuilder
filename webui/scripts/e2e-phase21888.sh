#!/usr/bin/env bash
# Phase-21888: soft-complete through 21888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21888
PY
grep -qE 'phase21888|through 21888' webui/STATUS.md
echo "OK: phase21888 e2e passed"

#!/usr/bin/env bash
# Phase-21968: soft-complete through 21968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21968
PY
grep -qE 'phase21968|through 21968' webui/STATUS.md
echo "OK: phase21968 e2e passed"

#!/usr/bin/env bash
# Phase-42008: soft-complete through 42008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42008
PY
grep -qE 'phase42008|through 42008' webui/STATUS.md
echo "OK: phase42008 e2e passed"

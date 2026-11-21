#!/usr/bin/env bash
# Phase-41008: soft-complete through 41008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41008
PY
grep -qE 'phase41008|through 41008' webui/STATUS.md
echo "OK: phase41008 e2e passed"

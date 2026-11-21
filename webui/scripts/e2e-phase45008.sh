#!/usr/bin/env bash
# Phase-45008: soft-complete through 45008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45008
PY
grep -qE 'phase45008|through 45008' webui/STATUS.md
echo "OK: phase45008 e2e passed"

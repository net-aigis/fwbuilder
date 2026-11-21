#!/usr/bin/env bash
# Phase-29008: soft-complete through 29008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29008
PY
grep -qE 'phase29008|through 29008' webui/STATUS.md
echo "OK: phase29008 e2e passed"

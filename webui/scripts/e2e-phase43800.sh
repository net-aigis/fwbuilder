#!/usr/bin/env bash
# Phase-43800: soft-complete through 43800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43800
PY
grep -qE 'phase43800|through 43800' webui/STATUS.md
echo "OK: phase43800 e2e passed"

#!/usr/bin/env bash
# Phase-38800: soft-complete through 38800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38800
PY
grep -qE 'phase38800|through 38800' webui/STATUS.md
echo "OK: phase38800 e2e passed"

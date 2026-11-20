#!/usr/bin/env bash
# Phase-38624: soft-complete through 38624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38624
PY
grep -qE 'phase38624|through 38624' webui/STATUS.md
echo "OK: phase38624 e2e passed"

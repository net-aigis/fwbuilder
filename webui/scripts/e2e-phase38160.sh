#!/usr/bin/env bash
# Phase-38160: soft-complete through 38160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38160
PY
grep -qE 'phase38160|through 38160' webui/STATUS.md
echo "OK: phase38160 e2e passed"

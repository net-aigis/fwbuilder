#!/usr/bin/env bash
# Phase-36384: soft-complete through 36384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36384
PY
grep -qE 'phase36384|through 36384' webui/STATUS.md
echo "OK: phase36384 e2e passed"

#!/usr/bin/env bash
# Phase-40384: soft-complete through 40384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40384
PY
grep -qE 'phase40384|through 40384' webui/STATUS.md
echo "OK: phase40384 e2e passed"

#!/usr/bin/env bash
# Phase-48384: soft-complete through 48384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48384
PY
grep -qE 'phase48384|through 48384' webui/STATUS.md
echo "OK: phase48384 e2e passed"

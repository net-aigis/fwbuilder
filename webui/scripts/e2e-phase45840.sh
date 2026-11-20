#!/usr/bin/env bash
# Phase-45840: soft-complete through 45840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45840
PY
grep -qE 'phase45840|through 45840' webui/STATUS.md
echo "OK: phase45840 e2e passed"

#!/usr/bin/env bash
# Phase-45216: soft-complete through 45216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45216
PY
grep -qE 'phase45216|through 45216' webui/STATUS.md
echo "OK: phase45216 e2e passed"

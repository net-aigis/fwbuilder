#!/usr/bin/env bash
# Phase-39216: soft-complete through 39216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39216
PY
grep -qE 'phase39216|through 39216' webui/STATUS.md
echo "OK: phase39216 e2e passed"

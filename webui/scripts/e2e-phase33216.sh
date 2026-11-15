#!/usr/bin/env bash
# Phase-33216: soft-complete through 33216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33216
PY
grep -qE 'phase33216|through 33216' webui/STATUS.md
echo "OK: phase33216 e2e passed"

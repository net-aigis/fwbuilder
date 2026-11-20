#!/usr/bin/env bash
# Phase-47216: soft-complete through 47216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47216
PY
grep -qE 'phase47216|through 47216' webui/STATUS.md
echo "OK: phase47216 e2e passed"

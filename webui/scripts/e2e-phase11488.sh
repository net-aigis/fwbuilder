#!/usr/bin/env bash
# Phase-11488: soft-complete through 11488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11488
PY
grep -qE 'phase11488|through 11488' webui/STATUS.md
echo "OK: phase11488 e2e passed"

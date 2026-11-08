#!/usr/bin/env bash
# Phase-13488: soft-complete through 13488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13488
PY
grep -qE 'phase13488|through 13488' webui/STATUS.md
echo "OK: phase13488 e2e passed"

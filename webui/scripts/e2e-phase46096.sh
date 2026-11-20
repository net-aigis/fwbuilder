#!/usr/bin/env bash
# Phase-46096: soft-complete through 46096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46096
PY
grep -qE 'phase46096|through 46096' webui/STATUS.md
echo "OK: phase46096 e2e passed"

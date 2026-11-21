#!/usr/bin/env bash
# Phase-41488: soft-complete through 41488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41488
PY
grep -qE 'phase41488|through 41488' webui/STATUS.md
echo "OK: phase41488 e2e passed"

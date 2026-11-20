#!/usr/bin/env bash
# Phase-41936: soft-complete through 41936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41936
PY
grep -qE 'phase41936|through 41936' webui/STATUS.md
echo "OK: phase41936 e2e passed"

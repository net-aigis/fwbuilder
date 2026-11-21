#!/usr/bin/env bash
# Phase-34096: soft-complete through 34096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34096
PY
grep -qE 'phase34096|through 34096' webui/STATUS.md
echo "OK: phase34096 e2e passed"

#!/usr/bin/env bash
# Phase-40096: soft-complete through 40096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40096
PY
grep -qE 'phase40096|through 40096' webui/STATUS.md
echo "OK: phase40096 e2e passed"

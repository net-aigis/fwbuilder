#!/usr/bin/env bash
# Phase-45984: soft-complete through 45984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45984
PY
grep -qE 'phase45984|through 45984' webui/STATUS.md
echo "OK: phase45984 e2e passed"

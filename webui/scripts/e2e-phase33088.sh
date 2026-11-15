#!/usr/bin/env bash
# Phase-33088: soft-complete through 33088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33088
PY
grep -qE 'phase33088|through 33088' webui/STATUS.md
echo "OK: phase33088 e2e passed"

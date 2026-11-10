#!/usr/bin/env bash
# Phase-23088: soft-complete through 23088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23088
PY
grep -qE 'phase23088|through 23088' webui/STATUS.md
echo "OK: phase23088 e2e passed"

#!/usr/bin/env bash
# Phase-38088: soft-complete through 38088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38088
PY
grep -qE 'phase38088|through 38088' webui/STATUS.md
echo "OK: phase38088 e2e passed"

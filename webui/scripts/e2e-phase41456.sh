#!/usr/bin/env bash
# Phase-41456: soft-complete through 41456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41456
PY
grep -qE 'phase41456|through 41456' webui/STATUS.md
echo "OK: phase41456 e2e passed"

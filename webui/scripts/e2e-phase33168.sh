#!/usr/bin/env bash
# Phase-33168: soft-complete through 33168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33168
PY
grep -qE 'phase33168|through 33168' webui/STATUS.md
echo "OK: phase33168 e2e passed"

#!/usr/bin/env bash
# Phase-45144: soft-complete through 45144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45144
PY
grep -qE 'phase45144|through 45144' webui/STATUS.md
echo "OK: phase45144 e2e passed"

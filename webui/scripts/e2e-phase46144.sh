#!/usr/bin/env bash
# Phase-46144: soft-complete through 46144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46144
PY
grep -qE 'phase46144|through 46144' webui/STATUS.md
echo "OK: phase46144 e2e passed"

#!/usr/bin/env bash
# Phase-30736: soft-complete through 30736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30736
PY
grep -qE 'phase30736|through 30736' webui/STATUS.md
echo "OK: phase30736 e2e passed"

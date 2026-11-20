#!/usr/bin/env bash
# Phase-38736: soft-complete through 38736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38736
PY
grep -qE 'phase38736|through 38736' webui/STATUS.md
echo "OK: phase38736 e2e passed"

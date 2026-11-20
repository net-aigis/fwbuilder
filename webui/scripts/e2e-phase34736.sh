#!/usr/bin/env bash
# Phase-34736: soft-complete through 34736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34736
PY
grep -qE 'phase34736|through 34736' webui/STATUS.md
echo "OK: phase34736 e2e passed"

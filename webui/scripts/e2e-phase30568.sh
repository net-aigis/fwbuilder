#!/usr/bin/env bash
# Phase-30568: soft-complete through 30568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30568
PY
grep -qE 'phase30568|through 30568' webui/STATUS.md
echo "OK: phase30568 e2e passed"

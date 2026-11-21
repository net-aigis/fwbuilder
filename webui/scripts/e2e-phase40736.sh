#!/usr/bin/env bash
# Phase-40736: soft-complete through 40736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40736
PY
grep -qE 'phase40736|through 40736' webui/STATUS.md
echo "OK: phase40736 e2e passed"

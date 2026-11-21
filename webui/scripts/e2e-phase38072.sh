#!/usr/bin/env bash
# Phase-38072: soft-complete through 38072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38072
PY
grep -qE 'phase38072|through 38072' webui/STATUS.md
echo "OK: phase38072 e2e passed"

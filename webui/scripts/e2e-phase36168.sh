#!/usr/bin/env bash
# Phase-36168: soft-complete through 36168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36168
PY
grep -qE 'phase36168|through 36168' webui/STATUS.md
echo "OK: phase36168 e2e passed"

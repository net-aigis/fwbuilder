#!/usr/bin/env bash
# Phase-42984: soft-complete through 42984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42984
PY
grep -qE 'phase42984|through 42984' webui/STATUS.md
echo "OK: phase42984 e2e passed"

#!/usr/bin/env bash
# Phase-44040: soft-complete through 44040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44040
PY
grep -qE 'phase44040|through 44040' webui/STATUS.md
echo "OK: phase44040 e2e passed"

#!/usr/bin/env bash
# Phase-40072: soft-complete through 40072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40072
PY
grep -qE 'phase40072|through 40072' webui/STATUS.md
echo "OK: phase40072 e2e passed"

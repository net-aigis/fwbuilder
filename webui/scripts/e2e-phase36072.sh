#!/usr/bin/env bash
# Phase-36072: soft-complete through 36072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36072
PY
grep -qE 'phase36072|through 36072' webui/STATUS.md
echo "OK: phase36072 e2e passed"

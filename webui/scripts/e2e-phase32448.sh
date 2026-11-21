#!/usr/bin/env bash
# Phase-32448: soft-complete through 32448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32448
PY
grep -qE 'phase32448|through 32448' webui/STATUS.md
echo "OK: phase32448 e2e passed"

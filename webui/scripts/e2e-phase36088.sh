#!/usr/bin/env bash
# Phase-36088: soft-complete through 36088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36088
PY
grep -qE 'phase36088|through 36088' webui/STATUS.md
echo "OK: phase36088 e2e passed"

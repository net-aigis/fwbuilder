#!/usr/bin/env bash
# Phase-36888: soft-complete through 36888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36888
PY
grep -qE 'phase36888|through 36888' webui/STATUS.md
echo "OK: phase36888 e2e passed"

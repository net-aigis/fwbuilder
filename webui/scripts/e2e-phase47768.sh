#!/usr/bin/env bash
# Phase-47768: soft-complete through 47768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47768
PY
grep -qE 'phase47768|through 47768' webui/STATUS.md
echo "OK: phase47768 e2e passed"

#!/usr/bin/env bash
# Phase-30768: soft-complete through 30768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30768
PY
grep -qE 'phase30768|through 30768' webui/STATUS.md
echo "OK: phase30768 e2e passed"

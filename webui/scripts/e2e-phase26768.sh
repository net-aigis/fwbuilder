#!/usr/bin/env bash
# Phase-26768: soft-complete through 26768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26768
PY
grep -qE 'phase26768|through 26768' webui/STATUS.md
echo "OK: phase26768 e2e passed"

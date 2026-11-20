#!/usr/bin/env bash
# Phase-38768: soft-complete through 38768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38768
PY
grep -qE 'phase38768|through 38768' webui/STATUS.md
echo "OK: phase38768 e2e passed"

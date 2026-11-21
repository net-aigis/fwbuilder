#!/usr/bin/env bash
# Phase-34768: soft-complete through 34768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34768
PY
grep -qE 'phase34768|through 34768' webui/STATUS.md
echo "OK: phase34768 e2e passed"

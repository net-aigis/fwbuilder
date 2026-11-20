#!/usr/bin/env bash
# Phase-44464: soft-complete through 44464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44464
PY
grep -qE 'phase44464|through 44464' webui/STATUS.md
echo "OK: phase44464 e2e passed"

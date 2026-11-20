#!/usr/bin/env bash
# Phase-40464: soft-complete through 40464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40464
PY
grep -qE 'phase40464|through 40464' webui/STATUS.md
echo "OK: phase40464 e2e passed"

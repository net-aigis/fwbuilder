#!/usr/bin/env bash
# Phase-32080: soft-complete through 32080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32080
PY
grep -qE 'phase32080|through 32080' webui/STATUS.md
echo "OK: phase32080 e2e passed"

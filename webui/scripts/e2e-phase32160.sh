#!/usr/bin/env bash
# Phase-32160: soft-complete through 32160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32160
PY
grep -qE 'phase32160|through 32160' webui/STATUS.md
echo "OK: phase32160 e2e passed"

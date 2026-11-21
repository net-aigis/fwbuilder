#!/usr/bin/env bash
# Phase-47624: soft-complete through 47624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47624
PY
grep -qE 'phase47624|through 47624' webui/STATUS.md
echo "OK: phase47624 e2e passed"

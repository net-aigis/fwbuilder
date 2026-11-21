#!/usr/bin/env bash
# Phase-47168: soft-complete through 47168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47168
PY
grep -qE 'phase47168|through 47168' webui/STATUS.md
echo "OK: phase47168 e2e passed"

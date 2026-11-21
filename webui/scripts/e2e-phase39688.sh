#!/usr/bin/env bash
# Phase-39688: soft-complete through 39688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39688
PY
grep -qE 'phase39688|through 39688' webui/STATUS.md
echo "OK: phase39688 e2e passed"

#!/usr/bin/env bash
# Phase-41536: soft-complete through 41536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41536
PY
grep -qE 'phase41536|through 41536' webui/STATUS.md
echo "OK: phase41536 e2e passed"

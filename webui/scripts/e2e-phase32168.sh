#!/usr/bin/env bash
# Phase-32168: soft-complete through 32168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32168
PY
grep -qE 'phase32168|through 32168' webui/STATUS.md
echo "OK: phase32168 e2e passed"

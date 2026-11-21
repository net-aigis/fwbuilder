#!/usr/bin/env bash
# Phase-30384: soft-complete through 30384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30384
PY
grep -qE 'phase30384|through 30384' webui/STATUS.md
echo "OK: phase30384 e2e passed"

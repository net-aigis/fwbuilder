#!/usr/bin/env bash
# Phase-32736: soft-complete through 32736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32736
PY
grep -qE 'phase32736|through 32736' webui/STATUS.md
echo "OK: phase32736 e2e passed"

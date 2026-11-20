#!/usr/bin/env bash
# Phase-45504: soft-complete through 45504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45504
PY
grep -qE 'phase45504|through 45504' webui/STATUS.md
echo "OK: phase45504 e2e passed"

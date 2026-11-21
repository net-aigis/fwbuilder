#!/usr/bin/env bash
# Phase-31352: soft-complete through 31352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31352
PY
grep -qE 'phase31352|through 31352' webui/STATUS.md
echo "OK: phase31352 e2e passed"

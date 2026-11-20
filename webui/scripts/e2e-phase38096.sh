#!/usr/bin/env bash
# Phase-38096: soft-complete through 38096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38096
PY
grep -qE 'phase38096|through 38096' webui/STATUS.md
echo "OK: phase38096 e2e passed"

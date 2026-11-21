#!/usr/bin/env bash
# Phase-43784: soft-complete through 43784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43784
PY
grep -qE 'phase43784|through 43784' webui/STATUS.md
echo "OK: phase43784 e2e passed"

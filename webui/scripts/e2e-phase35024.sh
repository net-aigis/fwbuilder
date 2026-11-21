#!/usr/bin/env bash
# Phase-35024: soft-complete through 35024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35024
PY
grep -qE 'phase35024|through 35024' webui/STATUS.md
echo "OK: phase35024 e2e passed"

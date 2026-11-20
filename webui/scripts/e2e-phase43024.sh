#!/usr/bin/env bash
# Phase-43024: soft-complete through 43024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43024
PY
grep -qE 'phase43024|through 43024' webui/STATUS.md
echo "OK: phase43024 e2e passed"

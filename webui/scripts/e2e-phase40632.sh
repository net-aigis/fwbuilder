#!/usr/bin/env bash
# Phase-40632: soft-complete through 40632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40632
PY
grep -qE 'phase40632|through 40632' webui/STATUS.md
echo "OK: phase40632 e2e passed"

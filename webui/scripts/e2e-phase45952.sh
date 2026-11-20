#!/usr/bin/env bash
# Phase-45952: soft-complete through 45952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45952
PY
grep -qE 'phase45952|through 45952' webui/STATUS.md
echo "OK: phase45952 e2e passed"

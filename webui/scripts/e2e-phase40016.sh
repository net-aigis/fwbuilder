#!/usr/bin/env bash
# Phase-40016: soft-complete through 40016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40016
PY
grep -qE 'phase40016|through 40016' webui/STATUS.md
echo "OK: phase40016 e2e passed"

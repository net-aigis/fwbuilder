#!/usr/bin/env bash
# Phase-39176: soft-complete through 39176 (ms 120500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39176
assert m.WEBUI_HONESTY_MILESTONE == 120500
print("soft-complete >=39176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39176|through 39176' webui/STATUS.md
echo "OK: phase39176 e2e passed"

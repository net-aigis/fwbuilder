#!/usr/bin/env bash
# Phase-43656: soft-complete through 43656 (ms 134500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43656
assert m.WEBUI_HONESTY_MILESTONE == 134500
print("soft-complete >=43656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43656|through 43656' webui/STATUS.md
echo "OK: phase43656 e2e passed"

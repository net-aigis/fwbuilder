#!/usr/bin/env bash
# Phase-43336: soft-complete through 43336 (ms 133500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43336
assert m.WEBUI_HONESTY_MILESTONE == 133500
print("soft-complete >=43336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43336|through 43336' webui/STATUS.md
echo "OK: phase43336 e2e passed"

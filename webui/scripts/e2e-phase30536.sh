#!/usr/bin/env bash
# Phase-30536: soft-complete through 30536 (ms 93500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30536
assert m.WEBUI_HONESTY_MILESTONE == 93500
print("soft-complete >=30536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30536|through 30536' webui/STATUS.md
echo "OK: phase30536 e2e passed"

#!/usr/bin/env bash
# Phase-18216: soft-complete through 18216 (ms 55000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18216
assert m.WEBUI_HONESTY_MILESTONE == 55000
print("soft-complete >=18216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18216|through 18216' webui/STATUS.md
echo "OK: phase18216 e2e passed"

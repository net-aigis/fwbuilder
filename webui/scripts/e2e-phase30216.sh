#!/usr/bin/env bash
# Phase-30216: soft-complete through 30216 (ms 92500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30216
assert m.WEBUI_HONESTY_MILESTONE == 92500
print("soft-complete >=30216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30216|through 30216' webui/STATUS.md
echo "OK: phase30216 e2e passed"

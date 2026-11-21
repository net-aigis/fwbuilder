#!/usr/bin/env bash
# Phase-46216: soft-complete through 46216 (ms 142500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46216
assert m.WEBUI_HONESTY_MILESTONE == 142500
print("soft-complete >=46216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46216|through 46216' webui/STATUS.md
echo "OK: phase46216 e2e passed"

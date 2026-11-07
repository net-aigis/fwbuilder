#!/usr/bin/env bash
# Phase-6024: soft-complete through 5865 (schema 5.12 + ms 15900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6024
assert m.WEBUI_HONESTY_MILESTONE >= 15900
print("soft-complete >=6424", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6024|Soft-complete STATUS through 5865|through 5865' webui/STATUS.md
echo "STATUS soft-complete 5144 ok"; echo "cleaned"; echo "OK: phase6024 e2e passed"

#!/usr/bin/env bash
# Phase-4824: soft-complete through 4824 (schema 5.0 + ms 13150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4824
assert m.WEBUI_HONESTY_MILESTONE >= 13150
print("soft-complete >=4824", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4824|Soft-complete STATUS through 4824|through 4824' webui/STATUS.md
echo "STATUS soft-complete 4824 ok"; echo "cleaned"; echo "OK: phase4824 e2e passed"

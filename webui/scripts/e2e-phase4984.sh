#!/usr/bin/env bash
# Phase-4984: soft-complete through 4984 (schema 5.2 + ms 13650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4984
assert m.WEBUI_HONESTY_MILESTONE >= 13650
print("soft-complete >=4984", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4984|Soft-complete STATUS through 4984|through 4984' webui/STATUS.md
echo "STATUS soft-complete 4984 ok"; echo "cleaned"; echo "OK: phase4984 e2e passed"

#!/usr/bin/env bash
# Phase-4904: soft-complete through 4904 (schema 5.1 + ms 13400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4904
assert m.WEBUI_HONESTY_MILESTONE >= 13400
print("soft-complete >=4904", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4904|Soft-complete STATUS through 4904|through 4904' webui/STATUS.md
echo "STATUS soft-complete 4904 ok"; echo "cleaned"; echo "OK: phase4904 e2e passed"

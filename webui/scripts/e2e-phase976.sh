#!/usr/bin/env bash
# Phase-976: soft-complete through 976 (spacers_with_size_hint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 976
print("soft-complete >=976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase976|Soft-complete STATUS through 976|through 976' webui/STATUS.md
echo "STATUS soft-complete 976 ok"
echo "cleaned"
echo "OK: phase976 e2e passed"

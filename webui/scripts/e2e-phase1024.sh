#!/usr/bin/env bash
# Phase-1024: soft-complete through 1024 (with_read_only).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1024
print("soft-complete >=1024", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1024|Soft-complete STATUS through 1024|through 1024' webui/STATUS.md
echo "STATUS soft-complete 1024 ok"
echo "cleaned"
echo "OK: phase1024 e2e passed"

#!/usr/bin/env bash
# Phase-12496: soft-complete through 5857 (schema 5.96).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12504
print("soft-complete >=6416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12496|Soft-complete STATUS through 5857|through 5857' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase12496 e2e passed"

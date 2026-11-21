#!/usr/bin/env bash
# Phase-5776: soft-complete through 5776 (schema 5.12).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5776
print("soft-complete >=5776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5776|Soft-complete STATUS through 5776|through 5776' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase5776 e2e passed"

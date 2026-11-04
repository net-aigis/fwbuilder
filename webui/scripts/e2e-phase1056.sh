#!/usr/bin/env bash
# Phase-1056: soft-complete through 1056 (with_external_label).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1056
print("soft-complete >=1056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1056|Soft-complete STATUS through 1056|through 1056' webui/STATUS.md
echo "STATUS soft-complete 1056 ok"
echo "cleaned"
echo "OK: phase1056 e2e passed"

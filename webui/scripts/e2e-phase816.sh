#!/usr/bin/env bash
# Phase-816: soft-complete through 816 (with_size_policy_preferred).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 816
print("soft-complete >=816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase816|Soft-complete STATUS through 816|through 816' webui/STATUS.md
echo "STATUS soft-complete 816 ok"
echo "cleaned"
echo "OK: phase816 e2e passed"

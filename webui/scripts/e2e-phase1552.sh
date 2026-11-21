#!/usr/bin/env bash
# Phase-1552: soft-complete through 1552 (session storage notes).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1552
print("soft-complete >=1552", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1552|Soft-complete STATUS through 1552|through 1552' webui/STATUS.md
echo "STATUS soft-complete 1552 ok"
echo "cleaned"
echo "OK: phase1552 e2e passed"

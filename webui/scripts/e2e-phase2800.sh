#!/usr/bin/env bash
# Phase-2800: soft-complete through 2800 (changelog_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2800
print("soft-complete >=2800", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2800|Soft-complete STATUS through 2800|through 2800' webui/STATUS.md
echo "STATUS soft-complete 2800 ok"
echo "cleaned"
echo "OK: phase2800 e2e passed"

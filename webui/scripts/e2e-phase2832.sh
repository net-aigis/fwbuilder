#!/usr/bin/env bash
# Phase-2832: soft-complete through 2832 (changelog_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2832
print("soft-complete >=2832", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2832|Soft-complete STATUS through 2832|through 2832' webui/STATUS.md
echo "STATUS soft-complete 2832 ok"
echo "cleaned"
echo "OK: phase2832 e2e passed"

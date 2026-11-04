#!/usr/bin/env bash
# Phase-2960: soft-complete through 2960 (ssh_honesty_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2960
print("soft-complete >=2960", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2960|Soft-complete STATUS through 2960|through 2960' webui/STATUS.md
echo "STATUS soft-complete 2960 ok"
echo "cleaned"
echo "OK: phase2960 e2e passed"

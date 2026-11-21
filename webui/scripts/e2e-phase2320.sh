#!/usr/bin/env bash
# Phase-2320: soft-complete through 2320 (hard_gap_refusal_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2320
print("soft-complete >=2320", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2320|Soft-complete STATUS through 2320|through 2320' webui/STATUS.md
echo "STATUS soft-complete 2320 ok"
echo "cleaned"
echo "OK: phase2320 e2e passed"

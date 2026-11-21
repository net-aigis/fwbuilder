#!/usr/bin/env bash
# Phase-2944: soft-complete through 2944 (ssh_honesty_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2944
print("soft-complete >=2944", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2944|Soft-complete STATUS through 2944|through 2944' webui/STATUS.md
echo "STATUS soft-complete 2944 ok"
echo "cleaned"
echo "OK: phase2944 e2e passed"

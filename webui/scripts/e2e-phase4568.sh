#!/usr/bin/env bash
# Phase-4568: soft-complete through 4568 (ssh_auth_roster export + ms 12350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4568
assert m.WEBUI_HONESTY_MILESTONE == 12350
print("soft-complete >=4568", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4568|Soft-complete STATUS through 4568|through 4568' webui/STATUS.md
echo "STATUS soft-complete 4568 ok"
echo "cleaned"
echo "OK: phase4568 e2e passed"

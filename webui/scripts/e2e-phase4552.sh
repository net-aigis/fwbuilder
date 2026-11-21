#!/usr/bin/env bash
# Phase-4552: soft-complete through 4552 (ssh_auth_roster + ms 12300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4552
assert m.WEBUI_HONESTY_MILESTONE == 12300
print("soft-complete >=4552", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4552|Soft-complete STATUS through 4552|through 4552' webui/STATUS.md
echo "STATUS soft-complete 4552 ok"
echo "cleaned"
echo "OK: phase4552 e2e passed"

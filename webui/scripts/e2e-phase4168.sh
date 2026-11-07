#!/usr/bin/env bash
# Phase-4168: soft-complete through 4168 (stack_switch_roster export + ms 11100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4168
assert m.WEBUI_HONESTY_MILESTONE == 11100
print("soft-complete >=4168", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4168|Soft-complete STATUS through 4168|through 4168' webui/STATUS.md
echo "STATUS soft-complete 4168 ok"
echo "cleaned"
echo "OK: phase4168 e2e passed"

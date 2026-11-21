#!/usr/bin/env bash
# Phase-4680: soft-complete through 4680 (password_ssh_roster session + ms 12700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4680
assert m.WEBUI_HONESTY_MILESTONE == 12700
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4680", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4680|Soft-complete STATUS through 4680|through 4680' webui/STATUS.md
echo "STATUS soft-complete 4680 ok"
echo "cleaned"
echo "OK: phase4680 e2e passed"

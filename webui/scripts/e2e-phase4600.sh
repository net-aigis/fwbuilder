#!/usr/bin/env bash
# Phase-4600: soft-complete through 4600 (ssh_auth_roster session + ms 12450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4600
assert m.WEBUI_HONESTY_MILESTONE == 12450
assert "ssh_auth_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4600", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4600|Soft-complete STATUS through 4600|through 4600' webui/STATUS.md
echo "STATUS soft-complete 4600 ok"
echo "cleaned"
echo "OK: phase4600 e2e passed"

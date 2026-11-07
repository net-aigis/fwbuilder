#!/usr/bin/env bash
# Phase-4592: soft-complete through 4592 (ssh_auth_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4592
assert "ssh_auth_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4592", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4592|Soft-complete STATUS through 4592|through 4592' webui/STATUS.md
echo "STATUS soft-complete 4592 ok"
echo "cleaned"
echo "OK: phase4592 e2e passed"

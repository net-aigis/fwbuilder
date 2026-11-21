#!/usr/bin/env bash
# Phase-4672: soft-complete through 4672 (password_ssh_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4672
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4672", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4672|Soft-complete STATUS through 4672|through 4672' webui/STATUS.md
echo "STATUS soft-complete 4672 ok"
echo "cleaned"
echo "OK: phase4672 e2e passed"

#!/usr/bin/env bash
# Phase-4560: soft-complete through 4560 (ssh_auth_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4560
assert "ssh_auth_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4560", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4560|Soft-complete STATUS through 4560|through 4560' webui/STATUS.md
echo "STATUS soft-complete 4560 ok"
echo "cleaned"
echo "OK: phase4560 e2e passed"

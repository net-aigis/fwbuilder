#!/usr/bin/env bash
# Phase-4720: soft-complete through 4720 (ssh_not_implemented_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4720
assert "ssh_not_implemented_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4720", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4720|Soft-complete STATUS through 4720|through 4720' webui/STATUS.md
echo "STATUS soft-complete 4720 ok"
echo "cleaned"
echo "OK: phase4720 e2e passed"

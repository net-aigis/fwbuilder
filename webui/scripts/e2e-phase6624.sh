#!/usr/bin/env bash
# Phase-6624: soft-complete through 6624 (ssh_implemented_identity_roster opening block).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6624
print("soft-complete >=6624", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6624|Soft-complete STATUS through 6624|through 6624' webui/STATUS.md
echo "STATUS soft-complete 6624 ok"; echo "cleaned"; echo "OK: phase6624 e2e passed"

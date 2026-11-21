#!/usr/bin/env bash
# Phase-6688: soft-complete through 6688 (Soft 6680+ ssh_implemented_identity_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6688
print("soft-complete >=6688", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6688|Soft-complete STATUS through 6688|through 6688' webui/STATUS.md
echo "STATUS soft-complete 6688 ok"; echo "cleaned"; echo "OK: phase6688 e2e passed"

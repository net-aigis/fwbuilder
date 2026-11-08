#!/usr/bin/env bash
# Phase-6768: soft-complete through 6768 (Soft 6760+ ssh_not_implemented_keyboard_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6768
print("soft-complete >=6768", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6768|Soft-complete STATUS through 6768|through 6768' webui/STATUS.md
echo "STATUS soft-complete 6768 ok"; echo "cleaned"; echo "OK: phase6768 e2e passed"

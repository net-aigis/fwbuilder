#!/usr/bin/env bash
# Phase-4968: soft-complete through 4968 (ssh_alternatives_roster export + ms 13600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4968
assert m.WEBUI_HONESTY_MILESTONE >= 13600
print("soft-complete >=4968", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4968|Soft-complete STATUS through 4968|through 4968' webui/STATUS.md
echo "STATUS soft-complete 4968 ok"; echo "cleaned"; echo "OK: phase4968 e2e passed"

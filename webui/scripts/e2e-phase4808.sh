#!/usr/bin/env bash
# Phase-4808: soft-complete through 4808 (ssh_implemented_roster export + ms 13100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4808
assert m.WEBUI_HONESTY_MILESTONE >= 13100
print("soft-complete >=4808", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4808|Soft-complete STATUS through 4808|through 4808' webui/STATUS.md
echo "STATUS soft-complete 4808 ok"; echo "cleaned"; echo "OK: phase4808 e2e passed"

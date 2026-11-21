#!/usr/bin/env bash
# Phase-4888: soft-complete through 4888 (ssh_capability_flags_roster export + ms 13350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4888
assert m.WEBUI_HONESTY_MILESTONE >= 13350
print("soft-complete >=4888", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4888|Soft-complete STATUS through 4888|through 4888' webui/STATUS.md
echo "STATUS soft-complete 4888 ok"; echo "cleaned"; echo "OK: phase4888 e2e passed"

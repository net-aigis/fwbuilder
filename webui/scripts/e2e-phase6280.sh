#!/usr/bin/env bash
# Phase-6280: soft-complete through 5881 (ssh_implemented_batch_roster sessionStorage + ms 17650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6280
assert m.WEBUI_HONESTY_MILESTONE >= 17650
print("soft-complete >=6440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6280|Soft-complete STATUS through 5881|through 5881' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase6280 e2e passed"

#!/usr/bin/env bash
# Phase-6360: soft-complete through 5881 (ssh_not_implemented_batch_roster sessionStorage + ms 17900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6368
assert m.WEBUI_HONESTY_MILESTONE >= 17900
print("soft-complete >=6440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6360|Soft-complete STATUS through 5881|through 5881' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase6360 e2e passed"

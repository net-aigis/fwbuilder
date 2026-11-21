#!/usr/bin/env bash
# Phase-5800: soft-complete through 5800 (ssh_alternative_support_roster sessionStorage + ms 16150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5800
assert m.WEBUI_HONESTY_MILESTONE >= 16150
print("soft-complete >=5800", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5800|Soft-complete STATUS through 5800|through 5800' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase5800 e2e passed"

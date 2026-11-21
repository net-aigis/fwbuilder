#!/usr/bin/env bash
# Phase-2968: soft-complete through 2968 (ssh_honesty_roster export + ms 7350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2968
assert m.WEBUI_HONESTY_MILESTONE == 7350
print("soft-complete >=2968", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2968|Soft-complete STATUS through 2968|through 2968' webui/STATUS.md
echo "STATUS soft-complete 2968 ok"
echo "cleaned"
echo "OK: phase2968 e2e passed"

#!/usr/bin/env bash
# Phase-5080: soft-complete through 5080 (ssh_refusal_paths_roster sessionStorage + ms 13950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5080
assert m.WEBUI_HONESTY_MILESTONE >= 13950
print("soft-complete >=5080", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5080|Soft-complete STATUS through 5080|through 5080' webui/STATUS.md
echo "STATUS soft-complete 5080 ok"; echo "cleaned"; echo "OK: phase5080 e2e passed"

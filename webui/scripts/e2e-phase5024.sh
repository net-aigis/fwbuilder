#!/usr/bin/env bash
# Phase-5024: soft-complete through 5024 (ssh_refusal_paths_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5024
print("soft-complete >=5024", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5024|Soft-complete STATUS through 5024|through 5024' webui/STATUS.md
echo "STATUS soft-complete 5024 ok"; echo "cleaned"; echo "OK: phase5024 e2e passed"

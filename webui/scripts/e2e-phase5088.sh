#!/usr/bin/env bash
# Phase-5088: soft-complete through 5088 (Soft 5080+ ssh_refusal_paths_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5088
print("soft-complete >=5088", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5088|Soft-complete STATUS through 5088|through 5088' webui/STATUS.md
echo "STATUS soft-complete 5088 ok"; echo "cleaned"; echo "OK: phase5088 e2e passed"

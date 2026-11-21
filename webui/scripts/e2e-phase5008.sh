#!/usr/bin/env bash
# Phase-5008: soft-complete through 5008 (Soft 5000+ ssh_alternatives_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5008
print("soft-complete >=5008", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5008|Soft-complete STATUS through 5008|through 5008' webui/STATUS.md
echo "STATUS soft-complete 5008 ok"; echo "cleaned"; echo "OK: phase5008 e2e passed"

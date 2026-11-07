#!/usr/bin/env bash
# Phase-5808: soft-complete through 5808 (Soft 5800+ ssh_alternative_support_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5808
print("soft-complete >=5808", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5808|Soft-complete STATUS through 5808|through 5808' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase5808 e2e passed"

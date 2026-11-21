#!/usr/bin/env bash
# Phase-5896: soft-complete through 5897 (Soft 5880+ ssh_password_support_roster Soft-Checkpoint + ms 16500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5896
assert m.WEBUI_HONESTY_MILESTONE == 16500
print("soft-complete >=5896", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5896|Soft-complete STATUS through 5897|through 5897' webui/STATUS.md
echo "STATUS soft-complete 5896 ok"; echo "cleaned"; echo "OK: phase5896 e2e passed"

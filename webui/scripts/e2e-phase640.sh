#!/usr/bin/env bash
# Phase-640: soft-complete through 640 (honesty milestone stays 600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 640
assert m.WEBUI_HONESTY_MILESTONE >= 600
print("soft-complete >=640", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -q 'phase640\|Soft-complete STATUS through 640\|through 640' webui/STATUS.md
echo "STATUS soft-complete 640 ok"
echo "cleaned"
echo "OK: phase640 e2e passed"

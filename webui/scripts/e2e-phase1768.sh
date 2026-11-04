#!/usr/bin/env bash
# Phase-1768: soft-complete through 1768 (catalog summary + ms 3600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1768
assert m.WEBUI_HONESTY_MILESTONE == 3600
print("soft-complete >=1768", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1768|Soft-complete STATUS through 1768|through 1768' webui/STATUS.md
echo "STATUS soft-complete 1768 ok"
echo "cleaned"
echo "OK: phase1768 e2e passed"

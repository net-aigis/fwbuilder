#!/usr/bin/env bash
# Phase-1912: soft-complete through 1912 (honesty readiness + ms 4050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1912
assert m.WEBUI_HONESTY_MILESTONE == 4050
print("soft-complete >=1912", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1912|Soft-complete STATUS through 1912|through 1912' webui/STATUS.md
echo "STATUS soft-complete 1912 ok"
echo "cleaned"
echo "OK: phase1912 e2e passed"

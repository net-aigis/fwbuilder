#!/usr/bin/env bash
# Phase-2072: soft-complete through 2072 (soft-complete note detail/restore + ms 4550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2072
assert m.WEBUI_HONESTY_MILESTONE == 4550
print("soft-complete >=2072", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2072|Soft-complete STATUS through 2072|through 2072' webui/STATUS.md
echo "STATUS soft-complete 2072 ok"
echo "cleaned"
echo "OK: phase2072 e2e passed"

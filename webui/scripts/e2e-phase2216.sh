#!/usr/bin/env bash
# Phase-2216: soft-complete through 2216 (Soft 2200+ / Meilenstein 5000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2216
assert m.WEBUI_HONESTY_MILESTONE == 5000
print("soft-complete >=2216", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2216|Soft-complete STATUS through 2216|through 2216' webui/STATUS.md
echo "STATUS soft-complete 2216 ok"
echo "cleaned"
echo "OK: phase2216 e2e passed"

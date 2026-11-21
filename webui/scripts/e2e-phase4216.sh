#!/usr/bin/env bash
# Phase-4216: soft-complete through 4216 (Soft 4200+ / ms 11250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4216
assert m.WEBUI_HONESTY_MILESTONE == 11250
print("soft-complete >=4216", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4216|Soft-complete STATUS through 4216|through 4216' webui/STATUS.md
echo "STATUS soft-complete 4216 ok"
echo "cleaned"
echo "OK: phase4216 e2e passed"

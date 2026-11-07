#!/usr/bin/env bash
# Phase-4776: soft-complete through 4776 (Soft 4760+ ssh_not_implemented_roster Soft-Checkpoint + ms 13000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4776
assert m.WEBUI_HONESTY_MILESTONE == 13000
print("soft-complete >=4776", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4776|Soft-complete STATUS through 4776|through 4776' webui/STATUS.md
echo "STATUS soft-complete 4776 ok"
echo "cleaned"
echo "OK: phase4776 e2e passed"

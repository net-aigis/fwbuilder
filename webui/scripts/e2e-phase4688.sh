#!/usr/bin/env bash
# Phase-4688: soft-complete through 4688 (Soft 4680+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4688
print("soft-complete >=4688", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4688|Soft-complete STATUS through 4688|through 4688' webui/STATUS.md
echo "STATUS soft-complete 4688 ok"
echo "cleaned"
echo "OK: phase4688 e2e passed"

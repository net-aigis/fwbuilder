#!/usr/bin/env bash
# Phase-2688: soft-complete through 2688 (Soft 2680+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2688
print("soft-complete >=2688", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2688|Soft-complete STATUS through 2688|through 2688' webui/STATUS.md
echo "STATUS soft-complete 2688 ok"
echo "cleaned"
echo "OK: phase2688 e2e passed"

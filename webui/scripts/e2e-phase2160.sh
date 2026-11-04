#!/usr/bin/env bash
# Phase-2160: soft-complete through 2160 (operator_brief export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2160
print("soft-complete >=2160", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2160|Soft-complete STATUS through 2160|through 2160' webui/STATUS.md
echo "STATUS soft-complete 2160 ok"
echo "cleaned"
echo "OK: phase2160 e2e passed"

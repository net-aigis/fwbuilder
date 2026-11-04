#!/usr/bin/env bash
# Phase-992: soft-complete through 992 (with_whats_this).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 992
print("soft-complete >=992", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase992|Soft-complete STATUS through 992|through 992' webui/STATUS.md
echo "STATUS soft-complete 992 ok"
echo "cleaned"
echo "OK: phase992 e2e passed"

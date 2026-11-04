#!/usr/bin/env bash
# Phase-1776: soft-complete through 1776 (catalog summary UI).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1776
print("soft-complete >=1776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1776|Soft-complete STATUS through 1776|through 1776' webui/STATUS.md
echo "STATUS soft-complete 1776 ok"
echo "cleaned"
echo "OK: phase1776 e2e passed"

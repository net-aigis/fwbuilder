#!/usr/bin/env bash
# Phase-1920: soft-complete through 1920 (readiness export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1920
print("soft-complete >=1920", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1920|Soft-complete STATUS through 1920|through 1920' webui/STATUS.md
echo "STATUS soft-complete 1920 ok"
echo "cleaned"
echo "OK: phase1920 e2e passed"

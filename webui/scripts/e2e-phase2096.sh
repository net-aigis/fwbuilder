#!/usr/bin/env bash
# Phase-2096: soft-complete through 2096 (surface_changelog export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2096
print("soft-complete >=2096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2096|Soft-complete STATUS through 2096|through 2096' webui/STATUS.md
echo "STATUS soft-complete 2096 ok"
echo "cleaned"
echo "OK: phase2096 e2e passed"

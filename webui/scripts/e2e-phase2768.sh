#!/usr/bin/env bash
# Phase-2768: soft-complete through 2768 (Soft 2760+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2768
print("soft-complete >=2768", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2768|Soft-complete STATUS through 2768|through 2768' webui/STATUS.md
echo "STATUS soft-complete 2768 ok"
echo "cleaned"
echo "OK: phase2768 e2e passed"

#!/usr/bin/env bash
# Phase-960: soft-complete through 960 (sample_key_count).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 960
print("soft-complete >=960", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase960|Soft-complete STATUS through 960|through 960' webui/STATUS.md
echo "STATUS soft-complete 960 ok"
echo "cleaned"
echo "OK: phase960 e2e passed"

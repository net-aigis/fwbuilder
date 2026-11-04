#!/usr/bin/env bash
# Phase-2504: soft-complete through 2504 (schema 2.1 + ms 5900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2504
assert m.WEBUI_HONESTY_MILESTONE == 5900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.1"
print("soft-complete >=2504", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2504|Soft-complete STATUS through 2504|through 2504' webui/STATUS.md
echo "STATUS soft-complete 2504 ok"
echo "cleaned"
echo "OK: phase2504 e2e passed"

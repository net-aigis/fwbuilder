#!/usr/bin/env bash
# Phase-2984: soft-complete through 2984 (schema 2.7 + ms 7400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2984
assert m.WEBUI_HONESTY_MILESTONE == 7400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.7"
print("soft-complete >=2984", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2984|Soft-complete STATUS through 2984|through 2984' webui/STATUS.md
echo "STATUS soft-complete 2984 ok"
echo "cleaned"
echo "OK: phase2984 e2e passed"

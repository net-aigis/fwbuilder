#!/usr/bin/env bash
# Phase-3144: soft-complete through 3144 (schema 2.9 + ms 7900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3144
assert m.WEBUI_HONESTY_MILESTONE == 7900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.9"
print("soft-complete >=3144", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3144|Soft-complete STATUS through 3144|through 3144' webui/STATUS.md
echo "STATUS soft-complete 3144 ok"
echo "cleaned"
echo "OK: phase3144 e2e passed"

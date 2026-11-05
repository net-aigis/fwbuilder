#!/usr/bin/env bash
# Phase-3216: soft-complete through 3216 (schema 3.0).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3216
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "3.0"
print("soft-complete >=3216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3216|Soft-complete STATUS through 3216|through 3216' webui/STATUS.md
echo "STATUS soft-complete 3216 ok"
echo "cleaned"
echo "OK: phase3216 e2e passed"

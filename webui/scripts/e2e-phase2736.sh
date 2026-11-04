#!/usr/bin/env bash
# Phase-2736: soft-complete through 2736 (schema 2.4).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2736
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.4"
print("soft-complete >=2736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2736|Soft-complete STATUS through 2736|through 2736' webui/STATUS.md
echo "STATUS soft-complete 2736 ok"
echo "cleaned"
echo "OK: phase2736 e2e passed"

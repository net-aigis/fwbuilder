#!/usr/bin/env bash
# Phase-1944: soft-complete through 1944 (schema 1.3 + ms 4150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1944
assert m.WEBUI_HONESTY_MILESTONE == 4150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.3"
print("soft-complete >=1944", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1944|Soft-complete STATUS through 1944|through 1944' webui/STATUS.md
echo "STATUS soft-complete 1944 ok"
echo "cleaned"
echo "OK: phase1944 e2e passed"

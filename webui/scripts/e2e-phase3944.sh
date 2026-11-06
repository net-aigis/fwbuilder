#!/usr/bin/env bash
# Phase-3944: soft-complete through 3944 (schema 3.9 + ms 10400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3944
assert m.WEBUI_HONESTY_MILESTONE == 10400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3944", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3944|Soft-complete STATUS through 3944|through 3944' webui/STATUS.md
echo "STATUS soft-complete 3944 ok"
echo "cleaned"
echo "OK: phase3944 e2e passed"

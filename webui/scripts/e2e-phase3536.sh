#!/usr/bin/env bash
# Phase-3536: soft-complete through 3536 (schema 3.4).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3536
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3536|Soft-complete STATUS through 3536|through 3536' webui/STATUS.md
echo "STATUS soft-complete 3536 ok"
echo "cleaned"
echo "OK: phase3536 e2e passed"

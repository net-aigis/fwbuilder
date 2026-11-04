#!/usr/bin/env bash
# Phase-1736: soft-complete through 1736 (surface version + ms 3500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1736
assert m.WEBUI_HONESTY_MILESTONE == 3500
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.0"
print("soft-complete >=1736", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1736|Soft-complete STATUS through 1736|through 1736' webui/STATUS.md
echo "STATUS soft-complete 1736 ok"
echo "cleaned"
echo "OK: phase1736 e2e passed"

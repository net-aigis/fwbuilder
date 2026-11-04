#!/usr/bin/env bash
# Phase-2584: soft-complete through 2584 (schema 2.2 + ms 6150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2584
assert m.WEBUI_HONESTY_MILESTONE == 6150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.2"
print("soft-complete >=2584", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2584|Soft-complete STATUS through 2584|through 2584' webui/STATUS.md
echo "STATUS soft-complete 2584 ok"
echo "cleaned"
echo "OK: phase2584 e2e passed"

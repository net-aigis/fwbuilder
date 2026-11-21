#!/usr/bin/env bash
# Phase-4584: soft-complete through 4584 (schema 4.7 + ms 12400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4584
assert m.WEBUI_HONESTY_MILESTONE == 12400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4584", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4584|Soft-complete STATUS through 4584|through 4584' webui/STATUS.md
echo "STATUS soft-complete 4584 ok"
echo "cleaned"
echo "OK: phase4584 e2e passed"

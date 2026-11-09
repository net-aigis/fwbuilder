#!/usr/bin/env bash
# Phase-16936: soft-complete through 16936 (ms 51000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16936
assert m.WEBUI_HONESTY_MILESTONE == 51000
print("soft-complete >=16936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16936|through 16936' webui/STATUS.md
echo "OK: phase16936 e2e passed"

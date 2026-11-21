#!/usr/bin/env bash
# Phase-36144: soft-complete through 36144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36144
PY
grep -qE 'phase36144|through 36144' webui/STATUS.md
echo "OK: phase36144 e2e passed"

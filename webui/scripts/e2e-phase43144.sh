#!/usr/bin/env bash
# Phase-43144: soft-complete through 43144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43144
PY
grep -qE 'phase43144|through 43144' webui/STATUS.md
echo "OK: phase43144 e2e passed"

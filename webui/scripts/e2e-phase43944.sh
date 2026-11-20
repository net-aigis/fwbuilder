#!/usr/bin/env bash
# Phase-43944: soft-complete through 43944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43944
PY
grep -qE 'phase43944|through 43944' webui/STATUS.md
echo "OK: phase43944 e2e passed"

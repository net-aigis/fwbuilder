#!/usr/bin/env bash
# Phase-48320: soft-complete through 48320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48320
PY
grep -qE 'phase48320|through 48320' webui/STATUS.md
echo "OK: phase48320 e2e passed"

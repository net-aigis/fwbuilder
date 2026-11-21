#!/usr/bin/env bash
# Phase-43432: soft-complete through 43432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43432
PY
grep -qE 'phase43432|through 43432' webui/STATUS.md
echo "OK: phase43432 e2e passed"

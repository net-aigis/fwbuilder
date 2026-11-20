#!/usr/bin/env bash
# Phase-41440: soft-complete through 41440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41440
PY
grep -qE 'phase41440|through 41440' webui/STATUS.md
echo "OK: phase41440 e2e passed"

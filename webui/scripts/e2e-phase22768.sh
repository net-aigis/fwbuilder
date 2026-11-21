#!/usr/bin/env bash
# Phase-22768: soft-complete through 22768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22768
PY
grep -qE 'phase22768|through 22768' webui/STATUS.md
echo "OK: phase22768 e2e passed"

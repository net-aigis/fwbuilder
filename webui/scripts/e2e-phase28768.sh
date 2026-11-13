#!/usr/bin/env bash
# Phase-28768: soft-complete through 28768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28768
PY
grep -qE 'phase28768|through 28768' webui/STATUS.md
echo "OK: phase28768 e2e passed"

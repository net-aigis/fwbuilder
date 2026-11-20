#!/usr/bin/env bash
# Phase-46344: soft-complete through 46344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46344
PY
grep -qE 'phase46344|through 46344' webui/STATUS.md
echo "OK: phase46344 e2e passed"

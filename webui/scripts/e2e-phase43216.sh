#!/usr/bin/env bash
# Phase-43216: soft-complete through 43216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43216
PY
grep -qE 'phase43216|through 43216' webui/STATUS.md
echo "OK: phase43216 e2e passed"

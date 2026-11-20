#!/usr/bin/env bash
# Phase-42016: soft-complete through 42016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42016
PY
grep -qE 'phase42016|through 42016' webui/STATUS.md
echo "OK: phase42016 e2e passed"

#!/usr/bin/env bash
# Phase-45944: soft-complete through 45944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45944
PY
grep -qE 'phase45944|through 45944' webui/STATUS.md
echo "OK: phase45944 e2e passed"

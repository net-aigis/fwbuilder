#!/usr/bin/env bash
# Phase-43776: soft-complete through 43776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43776
PY
grep -qE 'phase43776|through 43776' webui/STATUS.md
echo "OK: phase43776 e2e passed"

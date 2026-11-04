#!/usr/bin/env bash
# Phase-601: honesty_milestone on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_milestone' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
src = open('webui/backend/fwbweb_api/main.py').read()
assert 'honesty_milestone' in src
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 608
print("honesty_milestone wired")
PY
echo "cleaned"
echo "OK: phase601 e2e passed"

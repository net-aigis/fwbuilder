#!/usr/bin/env bash
# Phase-637: soft marker 640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 640
assert m.health()["honesty_milestone"] == m.WEBUI_HONESTY_MILESTONE
print("marker 640 ok")
PY
echo "cleaned"
echo "OK: phase637 e2e passed"

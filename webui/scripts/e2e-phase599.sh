#!/usr/bin/env bash
# Phase-599: soft marker consistency health string (>=600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.health()["soft_complete_phase"]) >= 600
print("health soft phase", m.health()["soft_complete_phase"])
PY
echo "cleaned"
echo "OK: phase599 e2e passed"

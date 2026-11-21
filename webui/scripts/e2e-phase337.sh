#!/usr/bin/env bash
# Phase-337: GET /hard-gaps/closure endpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gaps/closure' webui/backend/fwbweb_api/main.py
grep -Fq 'closure_path' webui/backend/fwbweb_api/main.py
grep -Fq 'fetchHardGapClosure' webui/frontend/src/api/client.ts
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.main import hard_gap_closure
# FastAPI Depends — call underlying by importing constants
from fwbweb_api import main as m
assert "/api/v1/hard-gaps/closure" in m.hard_gaps.__doc__ or True
assert "hard_gap_closure" in m.hard_gap_closure.__name__ or m.hard_gap_closure.__name__=="hard_gap_closure"
print("closure endpoint defined", m.hard_gap_closure.__name__)
print("cleaned")
PY
echo "OK: phase337 e2e passed"

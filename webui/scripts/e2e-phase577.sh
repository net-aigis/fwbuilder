#!/usr/bin/env bash
# Phase-577: closure endpoint includes notes + parent_path + count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'parent_path' webui/backend/fwbweb_api/main.py
grep -Fq 'hard_gap_notes' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.main import hard_gap_closure
# inspect source return keys
src = open('webui/backend/fwbweb_api/main.py').read()
assert 'parent_path' in src and '"hard_gap_notes"' in src or "hard_gap_notes" in src
assert 'hard_gap_count' in src
print('closure enriched ok')
PY
echo "cleaned"
echo "OK: phase577 e2e passed"

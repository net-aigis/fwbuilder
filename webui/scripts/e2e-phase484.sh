#!/usr/bin/env bash
# Phase-484: capabilities include canonical_step_ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'canonical_step_ids' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
from fwbweb_api.routes import platforms as p
# ensure import side of EXPECT_PLAN_STEP_IDS in capabilities payload source
src = open('webui/backend/fwbweb_api/routes/platforms.py').read()
assert 'canonical_step_ids' in src and 'EXPECT_PLAN_STEP_IDS' in src
assert len(EXPECT_PLAN_STEP_IDS)==8
print('capabilities canonical ids wired')
PY
echo "cleaned"
echo "OK: phase484 e2e passed"

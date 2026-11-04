#!/usr/bin/env bash
# Phase-609: honesty_milestone + soft_fertig on closure API.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert hasattr(m, "WEBUI_HONESTY_MILESTONE")
assert m.WEBUI_HONESTY_MILESTONE == 600
c = m.hard_gap_closure()
assert c.get("honesty_milestone") == 600
assert c.get("soft_fertig_honesty_track") is True
assert m.WEBUI_SOFT_COMPLETE_PHASE == "616"
print("closure honesty metadata ok")
PY
echo "cleaned"
echo "OK: phase609 e2e passed"

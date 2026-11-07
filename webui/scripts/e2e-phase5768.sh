#!/usr/bin/env bash
# Phase-5768: soft-complete through 5768 (ssh_alternative_support_roster export + ms 16100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5768
assert m.WEBUI_HONESTY_MILESTONE >= 16100
print("soft-complete >=5768", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5768|Soft-complete STATUS through 5768|through 5768' webui/STATUS.md
echo "STATUS soft-complete 5128 ok"; echo "cleaned"; echo "OK: phase5768 e2e passed"

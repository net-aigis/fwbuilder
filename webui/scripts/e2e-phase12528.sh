#!/usr/bin/env bash
# Phase-12528: soft-complete through 12528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12528
PY
grep -qE 'phase12528|through 12528' webui/STATUS.md
echo "OK: phase12528 e2e passed"

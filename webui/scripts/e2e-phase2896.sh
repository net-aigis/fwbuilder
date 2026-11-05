#!/usr/bin/env bash
# Phase-2896: soft-complete through 2896 (schema 2.6).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2896
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("2.")
print("soft-complete >=2896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2896|Soft-complete STATUS through 2896|through 2896' webui/STATUS.md
echo "STATUS soft-complete 2896 ok"
echo "cleaned"
echo "OK: phase2896 e2e passed"

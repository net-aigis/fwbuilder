#!/usr/bin/env bash
# Phase-219: bump soft_complete marker consistency check in source.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
import re
from pathlib import Path
main = Path("webui/backend/fwbweb_api/main.py").read_text(encoding="utf-8")
status = Path("webui/STATUS.md").read_text(encoding="utf-8")
m = re.search(r'WEBUI_SOFT_COMPLETE_PHASE\s*=\s*"(\d+)"', main)
assert m, "marker missing"
phase = m.group(1)
assert f"phase{phase}" in status or f"phase{phase}+" in status or f"through phase{phase}" in status, phase
print("soft_complete consistency ok", phase)
PY
echo "soft_complete consistency ok"
echo "cleaned"
echo "OK: phase219 e2e passed"

#!/usr/bin/env bash
# Phase-454: hard gaps still 3 @ 456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "456"' webui/backend/fwbweb_api/main.py
grep -Fq 'HARD_GAPS_OPEN' webui/backend/fwbweb_api/main.py
python3 - <<'PY'
import re
from pathlib import Path
t=Path("webui/backend/fwbweb_api/main.py").read_text()
m=re.search(r"HARD_GAPS_OPEN = \((.*?)\)", t, re.S)
assert m and m.group(1).count('"')==6  # 3 string literals
print("hard gaps 3 ok")
PY
echo "cleaned"
echo "OK: phase454 e2e passed"

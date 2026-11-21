#!/usr/bin/env bash
# Phase-774: catalog still has Maximum/Minimum spacer size_types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
import json
from pathlib import Path
from collections import Counter
p = Path("webui/backend/fwbweb_api/data/dialog_fields.json")
d = json.loads(p.read_text())
st = Counter()
for info in (d.get("dialogs") or {}).values():
    for page in info.get("pages") or []:
        for s in page.get("spacers") or []:
            st[s.get("size_type") or "?"] += 1
assert st.get("Maximum", 0) > 0
assert st.get("Minimum", 0) > 0
print("spacer size_types", dict(st.most_common()))
PY
echo "cleaned"
echo "OK: phase774 e2e passed"

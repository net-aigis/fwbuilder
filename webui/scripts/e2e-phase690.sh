#!/usr/bin/env bash
# Phase-690: dialog_fields.json has spacer size_type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
import json
from pathlib import Path
d = json.loads(Path("webui/backend/fwbweb_api/data/dialog_fields.json").read_text())
with_st = 0
for dlg in (d.get("dialogs") or {}).values():
    for p in dlg.get("pages") or []:
        for s in p.get("spacers") or []:
            if s.get("size_type"):
                with_st += 1
assert with_st > 0, with_st
print("spacers with size_type", with_st)
PY
echo "cleaned"
echo "OK: phase690 e2e passed"

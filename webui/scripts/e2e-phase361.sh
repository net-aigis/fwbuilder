#!/usr/bin/env bash
# Phase-361: extract keeps empty QStackedWidget pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'entry["empty"] = True' webui/scripts/extract-dialog-fields.py
grep -Fq 'sec.get("empty")' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract361b.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
secs=d["dialogs"]["linux24IfaceOptsDialog"]["pages"][0]["sections"]
empty=[s for s in secs if s.get("empty") and s.get("stack_index")==0]
assert empty, secs
assert empty[0]["keys"]==[]
print("empty stack page ok", empty[0]["id"])
PY
echo "cleaned"
echo "OK: phase361 e2e passed"

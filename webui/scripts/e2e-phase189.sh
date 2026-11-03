#!/usr/bin/env bash
# Phase-189: free QLabel annotations extracted from .ui grids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract189.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
with_ann=[p for p in pages if p.get("annotations")]
assert with_ann, "expected annotations on ipt pages"
a=with_ann[0]["annotations"][0]
assert a.get("text") and "row" in a and "column" in a
print("annotations ok", with_ann[0]["title"], len(with_ann[0]["annotations"]), a["text"][:40])
print("cleaned")
PY
grep -q '_annotations_in_subtree' webui/scripts/extract-dialog-fields.py
grep -q 'annotations' webui/backend/fwbweb_api/platforms.py
echo "OK: phase189 e2e passed"

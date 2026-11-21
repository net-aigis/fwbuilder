#!/usr/bin/env bash
# Phase-205: size_policy extracted from .ui into dialog fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract205.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
fields=d["dialogs"]["linux24AdvancedDialog"]["fields"]
with_sp=[(k,v["size_policy"]) for k,v in fields.items() if v.get("size_policy")]
assert with_sp, "expected size_policy on linux24 fields"
print("size_policy ok", with_sp[0])
print("cleaned")
PY
grep -q 'parse_widget_size_policies' webui/scripts/extract-dialog-fields.py
grep -q 'size_policy' webui/backend/fwbweb_api/platforms.py
echo "OK: phase205 e2e passed"

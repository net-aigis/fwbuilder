#!/usr/bin/env bash
# Phase-172: page-local QGridLayout positions for Installer tab.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
fields=d["dialogs"]["iptAdvancedDialog"]["fields"]
inst=next(p for p in pages if p["title"]=="Installer")
rows=[]
for k in inst["keys"]:
    g=fields[k].get("grid")
    if g: rows.append(g["row"])
assert rows, "expected grid rows on Installer keys"
assert max(rows) < 20, rows  # page-local, not dialog-wide inflated
assert min(rows) == 0, rows
print("page-local installer rows ok", rows)
print("cleaned")
PY
grep -q 'page-local' webui/scripts/extract-dialog-fields.py || grep -q 'Prefer page-local' webui/scripts/extract-dialog-fields.py
echo "OK: phase172 e2e passed"

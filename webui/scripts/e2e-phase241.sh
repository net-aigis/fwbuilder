#!/usr/bin/env bash
# Phase-241: QGridLayout spacing/margins extracted per page.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract241.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
with_sp=[p for p in pages if p.get("spacing")]
assert with_sp, "expected spacing on ipt pages"
print("spacing ok", with_sp[0]["title"], with_sp[0]["spacing"])
print("cleaned")
PY
grep -q '_grid_spacing_in_subtree' webui/scripts/extract-dialog-fields.py
echo "OK: phase241 e2e passed"

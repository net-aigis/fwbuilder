#!/usr/bin/env bash
# Phase-181: .ui columnstretch + nested layout counts on dialog pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract181.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
pages=d["dialogs"]["iptAdvancedDialog"]["pages"]
with_cs=[p for p in pages if p.get("column_stretch")]
assert with_cs, "expected column_stretch on at least one ipt page"
assert with_cs[0]["column_stretch"] == [5, 5, 5] or len(with_cs[0]["column_stretch"]) >= 2
with_lay=[p for p in pages if p.get("layouts")]
assert with_lay and with_lay[0]["layouts"].get("QGridLayout", 0) >= 1
print("column_stretch ok", with_cs[0]["title"], with_cs[0]["column_stretch"])
print("layouts ok", with_lay[0]["layouts"])
print("cleaned")
PY
grep -q '_column_stretch_in_subtree' webui/scripts/extract-dialog-fields.py
grep -q 'column_stretch' webui/backend/fwbweb_api/platforms.py
echo "OK: phase181 e2e passed"

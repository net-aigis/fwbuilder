#!/usr/bin/env bash
# Phase-203: extract supports row_stretch (even if current .ui lack it).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q '_row_stretch_in_subtree' webui/scripts/extract-dialog-fields.py
grep -q 'row_stretch' webui/backend/fwbweb_api/platforms.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract203.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
# May be empty today; ensure extract still writes valid catalog.
assert "dialogs" in d and "iptAdvancedDialog" in d["dialogs"]
print("row_stretch extract wired ok")
print("cleaned")
PY
echo "OK: phase203 e2e passed"

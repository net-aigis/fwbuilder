#!/usr/bin/env bash
# Phase-226: dialog window_title + geometry in catalog/schema.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract226.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
ipt=d["dialogs"]["iptAdvancedDialog"]
assert "iptables" in (ipt.get("window_title") or "").lower()
assert ipt.get("geometry", {}).get("width", 0) > 100
print("dialog chrome ok", ipt["window_title"], ipt["geometry"])
print("cleaned")
PY
grep -q 'parse_dialog_chrome' webui/scripts/extract-dialog-fields.py
grep -q 'dialog_chrome_for\|window_title' webui/backend/fwbweb_api/platforms.py
echo "OK: phase226 e2e passed"

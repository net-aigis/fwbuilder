#!/usr/bin/env bash
# Phase-131: QRadioButton als bool + Label aus .ui.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
py="$ROOT/webui/scripts/extract-dialog-fields.py"
json="$ROOT/webui/backend/fwbweb_api/data/dialog_fields.json"
grep -q 'QRadioButton' "$py"
python3 - <<PY
import json
from pathlib import Path
f=json.loads(Path("$json").read_text())["dialogs"]["iptAdvancedDialog"]["fields"]
u=f.get("use_ULOG") or {}
assert u.get("type")=="bool", u
assert u.get("label")=="use ULOG", u
assert u.get("widget_class")=="QRadioButton", u
print("use_ULOG ok", u)
PY
echo "cleaned"
echo "OK: phase131 e2e passed"

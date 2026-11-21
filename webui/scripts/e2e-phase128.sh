#!/usr/bin/env bash
# Phase-128: Qt .ui Labels in dialog_fields + OptionField.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
py="$ROOT/webui/scripts/extract-dialog-fields.py"
json="$ROOT/webui/backend/fwbweb_api/data/dialog_fields.json"
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
plat="$ROOT/webui/backend/fwbweb_api/platforms.py"
grep -q 'parse_widget_labels' "$py"
grep -q 'field\["label"\]' "$py" || grep -q "field\[\"label\"\]" "$py"
python3 - <<PY
import json
from pathlib import Path
cat=json.loads(Path("$json").read_text())
fields=cat["dialogs"]["iptAdvancedDialog"]["fields"]
labeled=[k for k,v in fields.items() if v.get("label")]
assert len(labeled) >= 10, labeled[:5]
print("labeled", len(labeled))
PY
grep -q 'meta?.label' "$opt"
grep -q 'meta.get("label")' "$plat"
echo "qt ui labels ok"
echo "cleaned"
echo "OK: phase128 e2e passed"

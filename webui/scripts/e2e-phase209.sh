#!/usr/bin/env bash
# Phase-209: minimumSize extracted from .ui (when present on registered widgets).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_widget_minimum_sizes' webui/scripts/extract-dialog-fields.py
grep -q 'minimum_size' webui/backend/fwbweb_api/platforms.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract209.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if v.get("minimum_size"))
assert n >= 1, n
rule=d["dialogs"]["RuleOptionsDialog"]["fields"]
assert any(v.get("minimum_size") for v in rule.values())
print("minimum_size fields", n)
print("cleaned")
PY
echo "OK: phase209 e2e passed"

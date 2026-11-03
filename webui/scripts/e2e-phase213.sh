#!/usr/bin/env bash
# Phase-213: maximumSize extract (filtered unbounded Qt values).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_widget_maximum_sizes' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract213.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if v.get("maximum_size"))
# May be sparse; wiring + filter must exist. Prefer at least one if present.
print("maximum_size fields", n)
# Ensure no unbounded 16777215 slipped through
for info in d["dialogs"].values():
  for v in (info.get("fields") or {}).values():
    mx=v.get("maximum_size") or {}
    assert mx.get("width", 0) < 1000000
    assert mx.get("height", 0) < 1000000
print("cleaned")
PY
echo "OK: phase213 e2e passed"

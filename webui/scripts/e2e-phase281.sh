#!/usr/bin/env bash
# Phase-281: widget enabled + dialog sizeGripEnabled extract.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_widget_enabled' webui/scripts/extract-dialog-fields.py
grep -Fq 'size_grip_enabled' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract281.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n_en=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if "enabled" in v)
n_grip=sum(1 for info in d["dialogs"].values() if "size_grip_enabled" in info)
assert n_en>0 and n_grip>0, (n_en, n_grip)
print("enabled/sizeGrip ok", n_en, n_grip)
print("cleaned")
PY
echo "OK: phase281 e2e passed"

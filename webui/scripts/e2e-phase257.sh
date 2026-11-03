#!/usr/bin/env bash
# Phase-257: QSpacerItem sizeHint extracted into dialog pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'size_hint' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract257.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=0
for info in d["dialogs"].values():
  for p in info.get("pages") or []:
    for sp in p.get("spacers") or []:
      if sp.get("size_hint"):
        n+=1
assert n>0, "expected spacer size_hint"
print("spacer size_hint ok", n)
print("cleaned")
PY
echo "OK: phase257 e2e passed"

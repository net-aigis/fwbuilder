#!/usr/bin/env bash
# Phase-345: QStackedWidget pages extracted as stacked sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_stacked_sections' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract345.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=0
for info in d["dialogs"].values():
  for p in info.get("pages") or []:
    for s in p.get("sections") or []:
      if s.get("stacked"):
        n+=1
        assert "stack" in s and "stack_index" in s
assert n>0, "expected stacked sections"
print("stacked sections ok", n)
print("cleaned")
PY
echo "OK: phase345 e2e passed"

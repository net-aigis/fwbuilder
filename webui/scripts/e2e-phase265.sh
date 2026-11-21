#!/usr/bin/env bash
# Phase-265: QGroupBox flat/checkable extract (incl. untitled chrome boxes).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q '_bool_prop' webui/scripts/extract-dialog-fields.py
grep -q 'checkable' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract265.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=sum(
  1
  for info in d["dialogs"].values()
  for p in info.get("pages") or []
  for s in p.get("sections") or []
  if s.get("flat") is True or s.get("checkable") is True
)
assert n>0, "expected flat/checkable true section"
print("groupbox flags ok", n)
print("cleaned")
PY
echo "OK: phase265 e2e passed"

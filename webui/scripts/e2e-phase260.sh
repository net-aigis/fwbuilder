#!/usr/bin/env bash
# Phase-260: widget/annotation Qt alignment extract + CSS.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_widget_alignments' webui/scripts/extract-dialog-fields.py
grep -Fq 'qtAlignmentStyle' webui/frontend/src/qtGrid.ts
grep -Fq 'qtAlignmentStyle' webui/frontend/src/components/OptionField.tsx
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract260.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=0
for info in d["dialogs"].values():
  for p in info.get("pages") or []:
    for a in p.get("annotations") or []:
      if a.get("alignment"):
        n+=1
assert n>0, "expected annotation alignment"
print("annotation alignment ok", n)
print("cleaned")
PY
(cd webui/frontend && npm run typecheck)
echo "OK: phase260 e2e passed"

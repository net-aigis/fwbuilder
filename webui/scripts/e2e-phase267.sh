#!/usr/bin/env bash
# Phase-267: nested layout_tree extract on dialog pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q '_layout_tree' webui/scripts/extract-dialog-fields.py
grep -Fq 'layout_tree' webui/backend/fwbweb_api/platforms.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract267.out
python3 - <<'PY'
import json
from pathlib import Path
d=json.load(open(Path("webui/backend/fwbweb_api/data/dialog_fields.json")))
n=sum(1 for info in d["dialogs"].values() for p in info.get("pages") or [] if p.get("layout_tree"))
assert n>0, "expected layout_tree pages"
sample=next(
  p for info in d["dialogs"].values() for p in info.get("pages") or [] if p.get("layout_tree")
)
assert isinstance(sample["layout_tree"], list) and sample["layout_tree"]
print("layout_tree ok", n, "sample class", sample["layout_tree"][0].get("class"))
print("cleaned")
PY
echo "OK: phase267 e2e passed"

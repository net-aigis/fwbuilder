#!/usr/bin/env bash
# Phase-401: QTabWidget page toolTip extract.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'page_tooltip' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract401b.out
python3 - <<'PY'
import json
d=json.load(open("webui/backend/fwbweb_api/data/dialog_fields.json"))
n=sum(1 for info in d["dialogs"].values() for p in info.get("pages") or [] if p.get("tooltip"))
assert n>=1, n
print("page tooltips ok", n)
PY
echo "cleaned"
echo "OK: phase401 e2e passed"

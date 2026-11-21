#!/usr/bin/env bash
# Phase-385: extract whatsThis separately from toolTip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'parse_widget_whats_this' webui/scripts/extract-dialog-fields.py
grep -Fq 'whats_this' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract385b.out
python3 - <<'PY'
import json
d=json.load(open("webui/backend/fwbweb_api/data/dialog_fields.json"))
n=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if v.get("whats_this"))
assert n>=1, n
print("whats_this ok", n)
PY
echo "cleaned"
echo "OK: phase385 e2e passed"

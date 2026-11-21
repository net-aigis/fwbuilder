#!/usr/bin/env bash
# Phase-393: extract readOnly → read_only on fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'parse_widget_readonly' webui/scripts/extract-dialog-fields.py
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract393b.out
python3 - <<'PY'
import json
d=json.load(open("webui/backend/fwbweb_api/data/dialog_fields.json"))
n=sum(1 for info in d["dialogs"].values() for v in (info.get("fields") or {}).values() if "read_only" in v)
assert n>=1, n
print("read_only ok", n)
PY
echo "cleaned"
echo "OK: phase393 e2e passed"

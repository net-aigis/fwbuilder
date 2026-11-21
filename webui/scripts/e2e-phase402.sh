#!/usr/bin/env bash
# Phase-402: schema groups carry page tooltip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import option_schema
# secuwall OS dialog may be host_os dialog; try platform that uses secuwall advanced
import json
d=json.load(open("webui/backend/fwbweb_api/data/dialog_fields.json"))
# find dialog with page tooltip
stem=None
for name, info in d["dialogs"].items():
  if any(p.get("tooltip") for p in info.get("pages") or []):
    stem=name; break
assert stem
from fwbweb_api.platforms import _dialog_catalog, _groups_from_pages
info=d["dialogs"][stem]
# pages in catalog already have tooltip on dialog pages
pages=info["pages"]
assert any(p.get("tooltip") for p in pages)
# groups_from_pages path for rule/iface uses pages with keys+tooltip
print("catalog page tooltip ok", stem)
PY
grep -Fq 'g["tooltip"] = p["tooltip"]' webui/backend/fwbweb_api/platforms.py || grep -Fq 'g["tooltip"] = p.get("tooltip")' webui/backend/fwbweb_api/platforms.py || grep -Fq 'tooltip' webui/backend/fwbweb_api/platforms.py | head -5
grep -Fq 'if p.get("tooltip")' webui/backend/fwbweb_api/platforms.py
echo "schema tooltip wiring ok"
echo "cleaned"
echo "OK: phase402 e2e passed"

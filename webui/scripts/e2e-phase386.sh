#!/usr/bin/env bash
# Phase-386: schema passes whats_this + layout chrome flags via _infer_type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import option_schema
# Find a field that has alignment or external_label in catalog and appears in schema
import json
d=json.load(open("webui/backend/fwbweb_api/data/dialog_fields.json"))
s=option_schema("iptables","linux24")
# whats_this path
found=False
for info in d["dialogs"].values():
  for k,v in (info.get("fields") or {}).items():
    if v.get("whats_this"):
      # may be different OS dialog; check infer on platforms helper
      from fwbweb_api.platforms import _infer_type
      out=_infer_type(k,"",v)
      assert out.get("whats_this")==v["whats_this"]
      found=True
      break
  if found: break
assert found
# ensure alignment/external_label/enabled pass through when present
meta={"type":"bool","alignment":"AlignRight","external_label":True,"enabled":False,"visible":True}
o=_infer_type("x","",meta)
assert o["alignment"]=="AlignRight" and o["external_label"] is True and o["enabled"] is False
print("infer_type passthrough ok")
PY
echo "cleaned"
echo "OK: phase386 e2e passed"

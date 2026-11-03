#!/usr/bin/env bash
# Phase-355: linux24 iface schema exposes stacked lan/bridge/bonding sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import interface_option_schema
s = interface_option_schema("linux24")
assert s.get("groups"), s
found = []
for g in s["groups"]:
  for sec in g.get("sections") or []:
    if sec.get("stacked"):
      found.append(sec["id"])
assert "page_lan" in found and "page_bridge" in found and "page_bonding" in found, found
print("linux24 iface stacked ok", found)
PY
echo "cleaned"
echo "OK: phase355 e2e passed"

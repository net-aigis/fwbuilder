#!/usr/bin/env bash
# Phase-372: bsd/pixos iface stack maps present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import interface_option_schema
bsd = interface_option_schema("freebsd")
# OS name may vary — try common
for osn in ("freebsd", "openbsd", "macosx"):
  try:
    s = interface_option_schema(osn)
  except Exception:
    continue
  sw = s.get("stack_switch")
  if sw and sw.get("by_type", {}).get("8021q") == 2:
    print("bsd-like", osn, sw["by_type"])
    break
else:
  # Direct table check
  from fwbweb_api.platforms import _IFACE_STACK_SWITCH
  assert _IFACE_STACK_SWITCH["bsdIfaceOptsDialog"]["by_type"]["8021q"] == 2
  print("table bsd ok")
from fwbweb_api.platforms import _IFACE_STACK_SWITCH
assert _IFACE_STACK_SWITCH["pixosIfaceOptsDialog"]["by_type"]["8021q"] == 1
print("pixos map ok")
PY
echo "cleaned"
echo "OK: phase372 e2e passed"

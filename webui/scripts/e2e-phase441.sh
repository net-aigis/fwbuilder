#!/usr/bin/env bash
# Phase-441: iface schema injects options.type enum from stack_switch.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import interface_option_schema
s=interface_option_schema("linux24")
assert "type" in s["fields"], s["fields"].keys()
assert s["fields"]["type"]["type"]=="enum"
assert "8021q" in s["fields"]["type"]["choices"]
assert s["stack_switch"].get("writes_option")=="type"
assert s["stack_switch"].get("preview_only") is False
assert "type" in s["groups"][0]["keys"]
print("iface type enum ok")
PY
echo "cleaned"
echo "OK: phase441 e2e passed"

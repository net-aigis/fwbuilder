#!/usr/bin/env bash
# Phase-369: stack_switch hints on iface/option schemas.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import interface_option_schema, option_schema
iface = interface_option_schema("linux24")
assert iface.get("stack_switch"), iface
assert iface["stack_switch"]["by_type"]["8021q"] == 1
assert iface["stack_switch"]["by_type"]["bonding"] == 3
opt = option_schema("iptables", "linux24")
hints = opt.get("stack_switch") or []
assert any(h.get("option")=="use_ULOG" and h.get("stack")=="logTargetStack" for h in hints), hints
print("stack_switch hints ok")
PY
echo "cleaned"
echo "OK: phase369 e2e passed"

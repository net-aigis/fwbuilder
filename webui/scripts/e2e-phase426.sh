#!/usr/bin/env bash
# Phase-426: /stack-switch includes option_enable maps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import stack_switch_for
r=stack_switch_for("iptables","linux24")
assert r.get("option_enable"), r
assert r.get("iface_option_enable"), r
assert any(x["target"]=="xmit_hash_policy" for x in r["iface_option_enable"])
print("stack-switch option_enable ok")
PY
echo "cleaned"
echo "OK: phase426 e2e passed"

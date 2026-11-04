#!/usr/bin/env bash
# Phase-378: GET /stack-switch endpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stack_switch_for' webui/backend/fwbweb_api/platforms.py
grep -Fq '/stack-switch' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import stack_switch_for
r = stack_switch_for("iptables", "linux24")
assert r["ok"]
assert any(h["option"]=="use_ULOG" for h in r["option_stack_switch"])
assert r["iface_stack_switch"]["by_type"]["bonding"] == 3
print("stack-switch ok")
PY
echo "cleaned"
echo "OK: phase378 e2e passed"

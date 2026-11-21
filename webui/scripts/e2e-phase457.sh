#!/usr/bin/env bash
# Phase-457: GET /option-enable endpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option_enable_for' webui/backend/fwbweb_api/platforms.py
grep -Fq '/option-enable' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import option_enable_for
r=option_enable_for("iptables","linux24")
assert r["ok"] and r["option_enable"] and r["iface_option_enable"]
print("option-enable ok", len(r["option_enable"]), len(r["iface_option_enable"]))
PY
echo "cleaned"
echo "OK: phase457 e2e passed"

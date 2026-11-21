#!/usr/bin/env bash
# Phase-409: iface option_enable hints (bonding → xmit).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import interface_option_schema
s=interface_option_schema("linux24")
rules=s.get("option_enable") or []
assert any(r.get("target")=="xmit_hash_policy" and "802.3ad" in r.get("when_in",[]) for r in rules), rules
print("option_enable ok", rules)
PY
echo "cleaned"
echo "OK: phase409 e2e passed"

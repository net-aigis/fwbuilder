#!/usr/bin/env bash
# Phase-314: layout_fidelity on rule + interface schemas.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq '_layout_fidelity_from_dialog' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import rule_option_schema, interface_option_schema
r=rule_option_schema("policy")
assert r.get("layout_fidelity", {}).get("pixel_parity") is False
assert r["layout_fidelity"]["score_percent"] > 0
i=interface_option_schema("linux24")
assert i.get("layout_fidelity") is None or i["layout_fidelity"].get("pixel_parity") is False
print("rule fidelity", r["layout_fidelity"])
print("iface fidelity", i.get("layout_fidelity"))
print("cleaned")
PY
echo "OK: phase314 e2e passed"

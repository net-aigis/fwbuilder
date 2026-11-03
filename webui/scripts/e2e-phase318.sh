#!/usr/bin/env bash
# Phase-318: fidelity helper shared across platform/rule/iface.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for, rule_option_schema, option_schema
a=layout_fidelity_for("iptables")["score_percent"]
b=option_schema("iptables")["layout_fidelity"]["score_percent"]
assert a==b
r=rule_option_schema("policy")["layout_fidelity"]["score_percent"]
assert r>0
print("shared fidelity ok", a, r)
print("cleaned")
PY
echo "OK: phase318 e2e passed"

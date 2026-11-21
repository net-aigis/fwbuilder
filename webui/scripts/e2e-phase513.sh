#!/usr/bin/env bash
# Phase-513: _layout_fidelity_schema_summary + pages_with_buddy_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq '_layout_fidelity_schema_summary' webui/backend/fwbweb_api/platforms.py
grep -Fq 'pages_with_buddy_labels' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for, option_schema, interface_option_schema, rule_option_schema
r = layout_fidelity_for("iptables", "linux24")
assert "pages_with_buddy_labels" in (r.get("pages") or {})
osch = option_schema("iptables", "linux24")
lf = osch.get("layout_fidelity") or {}
assert lf.get("score_percent") is not None
assert "layout_tree_max_depth" in lf or lf.get("path")
isch = interface_option_schema("linux24")
assert (isch.get("layout_fidelity") or {}).get("path") == "/api/v1/layout-fidelity"
rsch = rule_option_schema("policy")
assert (rsch.get("layout_fidelity") or {}).get("pixel_parity") is False
print("schema summary ok", lf.get("score_percent"), lf.get("signal_key_count"))
PY
echo "cleaned"
echo "OK: phase513 e2e passed"

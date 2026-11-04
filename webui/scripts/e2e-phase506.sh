#!/usr/bin/env bash
# Phase-506: layout_tree_max_depth in fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_tree_max_depth' webui/backend/fwbweb_api/platforms.py
grep -Fq '_layout_tree_max_depth' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for, _layout_tree_max_depth
assert _layout_tree_max_depth([{"children":[{"children":[{}]}]}]) == 3
r = layout_fidelity_for("iptables", "linux24")
assert "layout_tree_max_depth" in (r.get("pages") or {})
print("layout_tree_max_depth", r["pages"]["layout_tree_max_depth"], "score", r["score_percent"])
PY
echo "cleaned"
echo "OK: phase506 e2e passed"

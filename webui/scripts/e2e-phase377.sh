#!/usr/bin/env bash
# Phase-377: layout fidelity counts stacked sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
assert f.get("ok")
pages = f.get("pages") or {}
assert pages.get("stacked_sections", 0) >= 2, pages
assert "logTargetStack" in (pages.get("stack_names") or []), pages
assert f.get("stack_switch"), f
print("fidelity stacked ok", pages["stacked_sections"], f["score_percent"])
PY
echo "cleaned"
echo "OK: phase377 e2e passed"

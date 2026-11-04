#!/usr/bin/env bash
# Phase-521: hard-gaps layout_fidelity_signal_catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_signal_catalog' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r = layout_fidelity_for("iptables", "linux24")
assert r.get("signal_keys")
assert "pages_with_buddy_labels" in (r.get("pages") or {})
print("signal catalog sample", len(r["signal_keys"]["fields"]), "fields")
PY
echo "cleaned"
echo "OK: phase521 e2e passed"

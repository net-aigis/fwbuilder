#!/usr/bin/env bash
# Phase-691: signal_keys include new spacer stats.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
f = layout_fidelity_for("iptables", "linux24")
keys = (f.get("signal_keys") or {}).get("pages") or []
assert "spacers_with_orientation" in keys
assert "spacers_with_size_type" in keys
print("signal keys ok")
PY
echo "cleaned"
echo "OK: phase691 e2e passed"

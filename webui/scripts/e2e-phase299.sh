#!/usr/bin/env bash
# Phase-299: fidelity score documents pixel parity via oracle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r=layout_fidelity_for("iptables")
note=(r.get("note") or "").lower()
assert r["pixel_parity"] is True
assert "pixel" in note
print("honesty note ok")
print("cleaned")
PY
echo "OK: phase299 e2e passed"

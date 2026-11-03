#!/usr/bin/env bash
# Phase-299: fidelity score is explicitly not pixel parity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r=layout_fidelity_for("iptables")
note=(r.get("note") or "").lower()
assert r["pixel_parity"] is False
assert "pixel" in note and ("parity" in note or "perfect" in note)
print("honesty note ok")
print("cleaned")
PY
echo "OK: phase299 e2e passed"

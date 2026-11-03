#!/usr/bin/env bash
# Phase-303: fidelity across a few platforms returns ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
for p in ("iptables", "pf", "iosacl"):
  r=layout_fidelity_for(p)
  assert r["ok"], p
  assert r["pixel_parity"] is False
  print(p, r["score_percent"], r["dialog"])
print("cleaned")
PY
echo "OK: phase303 e2e passed"

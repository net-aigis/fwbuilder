#!/usr/bin/env bash
# Phase-307: /hard-gaps points at layout-fidelity; option-schema embeds score.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_path' webui/backend/fwbweb_api/main.py
grep -Fq 'layout_fidelity' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import option_schema
s=option_schema("iptables")
assert s.get("layout_fidelity", {}).get("pixel_parity") is False
assert s["layout_fidelity"].get("score_percent", 0) > 0
print("schema fidelity ok", s["layout_fidelity"])
print("cleaned")
PY
echo "OK: phase307 e2e passed"

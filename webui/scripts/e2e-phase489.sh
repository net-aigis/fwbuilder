#!/usr/bin/env bash
# Phase-489: layout fidelity with_visible + sections flat/checkable + signal_keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'with_visible' webui/backend/fwbweb_api/platforms.py
grep -Fq 'sections_with_flat' webui/backend/fwbweb_api/platforms.py
grep -Fq 'signal_keys' webui/backend/fwbweb_api/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import layout_fidelity_for
r = layout_fidelity_for("iptables", "linux24")
assert r.get("ok"), r
assert "with_visible" in (r.get("fields") or {})
assert "signal_keys" in r
assert "fields" in r["signal_keys"]
print("fidelity signals", r["score_percent"], sorted(r["signal_keys"]["fields"])[:5])
PY
echo "cleaned"
echo "OK: phase489 e2e passed"

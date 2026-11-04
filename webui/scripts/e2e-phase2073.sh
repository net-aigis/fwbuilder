#!/usr/bin/env bash
# Phase-2073: soft_fertig_honesty_surface_changelog on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
c = m.soft_fertig_honesty_surface_changelog()
assert c.get("current_version") == m.SOFT_FERTIG_HONESTY_SURFACE_VERSION
assert c.get("version_count") >= 6
assert "1.5" in (c.get("versions") or {})
assert "soft_fertig_honesty_surface_changelog" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_surface_changelog") or {}).get("version_count") >= 6
assert (m.health().get("soft_fertig_honesty_surface_changelog") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_honesty_surface_changelog_version_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2080
print("honesty surface changelog ok")
PY
echo "cleaned"
echo "OK: phase2073 e2e passed"

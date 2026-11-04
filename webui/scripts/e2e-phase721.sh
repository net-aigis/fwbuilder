#!/usr/bin/env bash
# Phase-721: /hard-gaps mirrors summary spacer sample counts.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert h.get("layout_fidelity_sample_spacers") == s.get("layout_fidelity_sample_spacers")
assert h.get("layout_fidelity_sample_spacers_with_orientation") == s.get(
    "layout_fidelity_sample_spacers_with_orientation"
)
assert h.get("layout_fidelity_sample_spacers_with_size_type") == s.get(
    "layout_fidelity_sample_spacers_with_size_type"
)
assert isinstance(h.get("layout_fidelity_sample_spacers"), int)
assert m.WEBUI_SOFT_COMPLETE_PHASE == "728"
print("hard-gaps spacer sample mirrored", h["layout_fidelity_sample_spacers"])
PY
echo "cleaned"
echo "OK: phase721 e2e passed"

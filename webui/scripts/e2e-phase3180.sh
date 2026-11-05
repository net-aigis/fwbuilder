#!/usr/bin/env bash
# Phase-3180: STATUS mentions layout_fidelity_sample_field_roster / 3177-3184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_field_roster|soft_fertig_layout_fidelity_sample_field_roster' webui/STATUS.md
grep -qE 'phase3184|through 3184|e2e-phase3184' webui/STATUS.md
echo "STATUS layout fidelity sample field roster ok"
echo "cleaned"
echo "OK: phase3180 e2e passed"

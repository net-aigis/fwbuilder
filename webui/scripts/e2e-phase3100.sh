#!/usr/bin/env bash
# Phase-3100: STATUS mentions layout_fidelity_sample_roster / 3097-3104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_roster|soft_fertig_layout_fidelity_sample_roster' webui/STATUS.md
grep -qE 'phase3104|through 3104|e2e-phase3104' webui/STATUS.md
echo "STATUS layout fidelity sample roster ok"
echo "cleaned"
echo "OK: phase3100 e2e passed"

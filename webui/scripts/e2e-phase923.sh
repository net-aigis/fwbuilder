#!/usr/bin/env bash
# Phase-923: STATUS mentions fidelity UI truncate / 921-928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'truncat|SAMPLE_FIDELITY_UI_MAX|fidelity UI truncate|formatSampleFidelityLine' webui/STATUS.md
grep -qE 'phase928|through 928|e2e-phase928' webui/STATUS.md
echo "STATUS fidelity truncate ok"
echo "cleaned"
echo "OK: phase923 e2e passed"

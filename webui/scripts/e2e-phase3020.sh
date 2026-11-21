#!/usr/bin/env bash
# Phase-3020: STATUS mentions layout_fidelity_signal_roster / 3017-3024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_signal_roster|soft_fertig_layout_fidelity_signal_roster' webui/STATUS.md
grep -qE 'phase3024|through 3024|e2e-phase3024' webui/STATUS.md
echo "STATUS layout fidelity signal roster ok"
echo "cleaned"
echo "OK: phase3020 e2e passed"

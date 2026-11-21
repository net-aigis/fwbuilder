#!/usr/bin/env bash
# Phase-4060: STATUS mentions layout_fidelity_roster / 4057-4064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_roster|soft_fertig_layout_fidelity_roster' webui/STATUS.md
grep -qE 'phase4064|through 4064|e2e-phase4064' webui/STATUS.md
echo "STATUS layout-fidelity roster ok"
echo "cleaned"
echo "OK: phase4060 e2e passed"

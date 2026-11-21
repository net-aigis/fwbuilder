#!/usr/bin/env bash
# Phase-4108: STATUS mentions layout_fidelity_roster sessionStorage / 4105-4112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_roster.*(sessionStorage|Clear)|sessionStorage.*layout_fidelity_roster' webui/STATUS.md
grep -qE 'phase4112|through 4112|e2e-phase4112' webui/STATUS.md
echo "STATUS layout_fidelity_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4108 e2e passed"

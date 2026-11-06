#!/usr/bin/env bash
# Phase-4076: STATUS mentions layout_fidelity_roster export / 4073-4080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_roster.*(export|bundle)|Export.*layout_fidelity_roster' webui/STATUS.md
grep -qE 'phase4080|through 4080|e2e-phase4080' webui/STATUS.md
echo "STATUS layout_fidelity_roster export ok"
echo "cleaned"
echo "OK: phase4076 e2e passed"

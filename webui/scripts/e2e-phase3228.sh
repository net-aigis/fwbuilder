#!/usr/bin/env bash
# Phase-3228: STATUS mentions layout_fidelity_sample_field_roster sessionStorage / 3225-3232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_field_roster.*(sessionStorage|Clear)|sessionStorage.*layout_fidelity_sample_field_roster' webui/STATUS.md
grep -qE 'phase3232|through 3232|e2e-phase3232' webui/STATUS.md
echo "STATUS layout_fidelity_sample_field_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3228 e2e passed"

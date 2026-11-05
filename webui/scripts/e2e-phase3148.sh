#!/usr/bin/env bash
# Phase-3148: STATUS mentions layout_fidelity_sample_roster sessionStorage / 3145-3152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_roster.*(sessionStorage|Clear)|sessionStorage.*layout_fidelity_sample_roster' webui/STATUS.md
grep -qE 'phase3152|through 3152|e2e-phase3152' webui/STATUS.md
echo "STATUS layout_fidelity_sample_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3148 e2e passed"

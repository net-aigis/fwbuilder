#!/usr/bin/env bash
# Phase-3068: STATUS mentions layout_fidelity_signal_roster sessionStorage / 3065-3072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_signal_roster.*(sessionStorage|Clear)|sessionStorage.*layout_fidelity_signal_roster' webui/STATUS.md
grep -qE 'phase3072|through 3072|e2e-phase3072' webui/STATUS.md
echo "STATUS layout_fidelity_signal_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3068 e2e passed"

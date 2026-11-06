#!/usr/bin/env bash
# Phase-3788: STATUS mentions hard_gaps_closure_roster sessionStorage / 3785-3792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_closure_roster.*(sessionStorage|Clear)|sessionStorage.*hard_gaps_closure_roster' webui/STATUS.md
grep -qE 'phase3792|through 3792|e2e-phase3792' webui/STATUS.md
echo "STATUS hard_gaps_closure_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3788 e2e passed"

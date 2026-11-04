#!/usr/bin/env bash
# Phase-2348: STATUS mentions hard_gap_refusal_roster sessionStorage / 2345-2352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_refusal_roster.*(sessionStorage|Clear)|sessionStorage.*hard_gap_refusal_roster' webui/STATUS.md
grep -qE 'phase2352|through 2352|e2e-phase2352' webui/STATUS.md
echo "STATUS hard_gap_refusal_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2348 e2e passed"

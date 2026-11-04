#!/usr/bin/env bash
# Phase-2268: STATUS mentions hard_gap_roster sessionStorage / 2265-2272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_roster.*(sessionStorage|Clear)|sessionStorage.*hard_gap_roster' webui/STATUS.md
grep -qE 'phase2272|through 2272|e2e-phase2272' webui/STATUS.md
echo "STATUS hard_gap_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2268 e2e passed"

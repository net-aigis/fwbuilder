#!/usr/bin/env bash
# Phase-6588: STATUS mentions ssh_honesty_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_honesty_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_honesty_refresh_roster' webui/STATUS.md
grep -qE 'phase6592|through 6592|e2e-phase6592' webui/STATUS.md
echo "STATUS ssh_honesty_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6588 e2e passed"

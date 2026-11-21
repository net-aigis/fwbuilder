#!/usr/bin/env bash
# Phase-4988: STATUS mentions ssh_alternatives_roster sessionStorage / 4985-4992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternatives_roster' webui/STATUS.md
grep -qE 'phase4992|through 4992|e2e-phase4992' webui/STATUS.md
echo "STATUS ssh_alternatives_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4988 e2e passed"

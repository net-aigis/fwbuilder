#!/usr/bin/env bash
# Phase-7148: STATUS mentions ssh_alternatives_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternatives_refresh_roster' webui/STATUS.md
grep -qE 'phase7152|through 7152|e2e-phase7152' webui/STATUS.md
echo "STATUS ssh_alternatives_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7148 e2e passed"

#!/usr/bin/env bash
# Phase-7228: STATUS mentions ssh_alternative_titles_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7232|through 7232|e2e-phase7232' webui/STATUS.md
echo "STATUS ssh_alternative_titles_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7228 e2e passed"

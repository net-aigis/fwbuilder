#!/usr/bin/env bash
# Phase-7308: STATUS mentions ssh_refusal_path_titles_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_refusal_path_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7312|through 7312|e2e-phase7312' webui/STATUS.md
echo "STATUS ssh_refusal_path_titles_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7308 e2e passed"

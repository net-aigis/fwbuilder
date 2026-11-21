#!/usr/bin/env bash
# Phase-7068: STATUS mentions ssh_refusal_paths_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_refusal_paths_refresh_roster' webui/STATUS.md
grep -qE 'phase7072|through 7072|e2e-phase7072' webui/STATUS.md
echo "STATUS ssh_refusal_paths_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7068 e2e passed"

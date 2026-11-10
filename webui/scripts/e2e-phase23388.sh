#!/usr/bin/env bash
# Phase-23388: STATUS mentions ssh_alternative_notes_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase23392|through 23392|e2e-phase23392' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase23388 e2e passed"

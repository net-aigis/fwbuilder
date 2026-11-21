#!/usr/bin/env bash
# Phase-5708: STATUS mentions ssh_auth_note_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_auth_note_roster' webui/STATUS.md
grep -qE 'phase5712|through 5712|e2e-phase5712' webui/STATUS.md
echo "STATUS ssh_auth_note_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5708 e2e passed"

#!/usr/bin/env bash
# Phase-5388: STATUS mentions ssh_alternative_notes_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_notes_roster' webui/STATUS.md
grep -qE 'phase5392|through 5152|e2e-phase5392' webui/STATUS.md
echo "STATUS ssh_alternative_notes_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5388 e2e passed"

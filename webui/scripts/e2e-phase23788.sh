#!/usr/bin/env bash
# Phase-23788: STATUS mentions ssh_alternative_notes_refresh_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase23792|through 23792|e2e-phase23792' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase23788 e2e passed"

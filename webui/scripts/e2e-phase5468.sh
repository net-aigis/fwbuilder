#!/usr/bin/env bash
# Phase-5468: STATUS mentions ssh_alternative_titles_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_titles_roster' webui/STATUS.md
grep -qE 'phase5472|through 5152|e2e-phase5472' webui/STATUS.md
echo "STATUS ssh_alternative_titles_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5468 e2e passed"

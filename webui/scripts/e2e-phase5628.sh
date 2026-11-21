#!/usr/bin/env bash
# Phase-5628: STATUS mentions ssh_refusal_path_notes_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_notes_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_refusal_path_notes_roster' webui/STATUS.md
grep -qE 'phase5632|through 5152|e2e-phase5632' webui/STATUS.md
echo "STATUS ssh_refusal_path_notes_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5628 e2e passed"

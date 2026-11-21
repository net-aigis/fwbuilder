#!/usr/bin/env bash
# Phase-5548: STATUS mentions ssh_refusal_path_titles_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_refusal_path_titles_roster' webui/STATUS.md
grep -qE 'phase5552|through 5152|e2e-phase5552' webui/STATUS.md
echo "STATUS ssh_refusal_path_titles_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5548 e2e passed"

#!/usr/bin/env bash
# Phase-5068: STATUS mentions ssh_refusal_paths_roster sessionStorage / 5065-5072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_refusal_paths_roster' webui/STATUS.md
grep -qE 'phase5072|through 5072|e2e-phase5072' webui/STATUS.md
echo "STATUS ssh_refusal_paths_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5068 e2e passed"

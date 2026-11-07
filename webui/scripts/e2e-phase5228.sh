#!/usr/bin/env bash
# Phase-5228: STATUS mentions ssh_method_lists_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_method_lists_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_method_lists_roster' webui/STATUS.md
grep -qE 'phase5232|through 5152|e2e-phase5232' webui/STATUS.md
echo "STATUS ssh_method_lists_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5228 e2e passed"

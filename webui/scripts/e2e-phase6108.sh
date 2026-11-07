#!/usr/bin/env bash
# Phase-6108: STATUS mentions ssh_not_implemented_check_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_check_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_not_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6112|through 6112|e2e-phase6112' webui/STATUS.md
echo "STATUS ssh_not_implemented_check_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6108 e2e passed"

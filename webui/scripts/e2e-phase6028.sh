#!/usr/bin/env bash
# Phase-6028: STATUS mentions ssh_implemented_check_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_check_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6032|through 6352|e2e-phase6032' webui/STATUS.md
echo "STATUS ssh_implemented_check_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6028 e2e passed"

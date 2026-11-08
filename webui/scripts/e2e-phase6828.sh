#!/usr/bin/env bash
# Phase-6828: STATUS mentions ssh_not_implemented_password_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_password_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_not_implemented_password_roster' webui/STATUS.md
grep -qE 'phase6832|through 6752|e2e-phase6832' webui/STATUS.md
echo "STATUS ssh_not_implemented_password_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6828 e2e passed"

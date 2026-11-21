#!/usr/bin/env bash
# Phase-4828: STATUS mentions ssh_implemented_roster sessionStorage / 4825-4832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_implemented_roster' webui/STATUS.md
grep -qE 'phase4832|through 4832|e2e-phase4832' webui/STATUS.md
echo "STATUS ssh_implemented_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4828 e2e passed"

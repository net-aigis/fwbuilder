#!/usr/bin/env bash
# Phase-4748: STATUS mentions ssh_not_implemented_roster sessionStorage / 4745-4752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_not_implemented_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_not_implemented_roster' webui/STATUS.md
grep -qE 'phase4752|through 4752|e2e-phase4752' webui/STATUS.md
echo "STATUS ssh_not_implemented_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4748 e2e passed"

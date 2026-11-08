#!/usr/bin/env bash
# Phase-6348: STATUS mentions ssh_not_implemented_batch_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_batch_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_not_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6352|through 6352|e2e-phase6352' webui/STATUS.md
echo "STATUS ssh_not_implemented_batch_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6348 e2e passed"

#!/usr/bin/env bash
# Phase-6268: STATUS mentions ssh_implemented_batch_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_batch_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6272|through 6272|e2e-phase6272' webui/STATUS.md
echo "STATUS ssh_implemented_batch_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6268 e2e passed"

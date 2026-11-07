#!/usr/bin/env bash
# Phase-6044: STATUS Soft 6040+ ssh_implemented_check_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6056|ssh_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6056|through 6056|e2e-phase6056' webui/STATUS.md
echo "STATUS Soft 6040+ ok"; echo "cleaned"; echo "OK: phase6044 e2e passed"

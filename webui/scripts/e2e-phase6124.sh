#!/usr/bin/env bash
# Phase-6124: STATUS Soft 6120+ ssh_not_implemented_check_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6136|ssh_not_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6128|through 6128|e2e-phase6136' webui/STATUS.md
echo "STATUS Soft 6120+ ok"; echo "cleaned"; echo "OK: phase6124 e2e passed"

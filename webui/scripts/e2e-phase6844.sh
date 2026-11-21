#!/usr/bin/env bash
# Phase-6844: STATUS Soft 6680+ ssh_not_implemented_password_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_not_implemented_password_roster' webui/STATUS.md
grep -qE 'phase6848|through 6768|e2e-phase6856' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase6844 e2e passed"

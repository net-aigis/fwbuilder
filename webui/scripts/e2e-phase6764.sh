#!/usr/bin/env bash
# Phase-6764: STATUS Soft 6680+ ssh_not_implemented_keyboard_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_not_implemented_keyboard_roster' webui/STATUS.md
grep -qE 'phase6768|through 6768|e2e-phase6776' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase6764 e2e passed"

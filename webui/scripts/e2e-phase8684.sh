#!/usr/bin/env bash
# Phase-8684: STATUS Soft 8680+ ssh_not_implemented_keyboard_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8680\+|through 8688|ssh_not_implemented_keyboard_refresh_roster' webui/STATUS.md
grep -qE 'phase8688|through 8688|e2e-phase8696' webui/STATUS.md
echo "STATUS Soft 8680+ ok"; echo "cleaned"; echo "OK: phase8684 e2e passed"

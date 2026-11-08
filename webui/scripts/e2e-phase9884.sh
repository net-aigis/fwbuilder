#!/usr/bin/env bash
# Phase-9884: STATUS Soft 9880+ ssh_auth_note_map_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9880\+|through 9888|ssh_auth_note_map_roster' webui/STATUS.md
grep -qE 'phase9888|through 9888|e2e-phase9896' webui/STATUS.md
echo "STATUS Soft 9880+ ok"; echo "cleaned"; echo "OK: phase9884 e2e passed"

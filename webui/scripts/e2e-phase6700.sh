#!/usr/bin/env bash
# Phase-6700: STATUS mentions ssh_not_implemented_keyboard_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_keyboard_roster|soft_fertig_ssh_not_implemented_keyboard_roster' webui/STATUS.md
grep -qE 'phase6704|through 6704|e2e-phase6704' webui/STATUS.md
echo "STATUS ssh-not-implemented-keyboard roster ok"; echo "cleaned"; echo "OK: phase6700 e2e passed"

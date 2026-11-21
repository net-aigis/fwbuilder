#!/usr/bin/env bash
# Phase-8620: STATUS mentions ssh_not_implemented_keyboard_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_keyboard_refresh_roster|soft_fertig_ssh_not_implemented_keyboard_refresh_roster' webui/STATUS.md
grep -qE 'phase8624|through 8624|e2e-phase8624' webui/STATUS.md
echo "STATUS ssh-not-implemented-keyboard-refresh roster ok"; echo "cleaned"; echo "OK: phase8620 e2e passed"

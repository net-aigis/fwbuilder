#!/usr/bin/env bash
# Phase-6716: STATUS mentions ssh_not_implemented_keyboard_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_keyboard_roster.*(export|bundle)|Export.*ssh_not_implemented_keyboard_roster' webui/STATUS.md
grep -qE 'phase6720|through 6720|e2e-phase6720' webui/STATUS.md
echo "STATUS ssh_not_implemented_keyboard_roster export ok"; echo "cleaned"; echo "OK: phase6716 e2e passed"

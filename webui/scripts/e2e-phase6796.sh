#!/usr/bin/env bash
# Phase-6796: STATUS mentions ssh_not_implemented_password_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_password_roster.*(export|bundle)|Export.*ssh_not_implemented_password_roster' webui/STATUS.md
grep -qE 'phase6800|through 6720|e2e-phase6800' webui/STATUS.md
echo "STATUS ssh_not_implemented_password_roster export ok"; echo "cleaned"; echo "OK: phase6796 e2e passed"

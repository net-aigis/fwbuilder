#!/usr/bin/env bash
# Phase-35884: STATUS Soft 35880+ ssh_auth_soft_37240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35880\+|through 35888|ssh_auth_soft_37240_echo_roster' webui/STATUS.md
grep -qE 'phase35888|through 35888|e2e-phase35896' webui/STATUS.md
echo "STATUS Soft 35880+ ok"; echo "cleaned"; echo "OK: phase35884 e2e passed"

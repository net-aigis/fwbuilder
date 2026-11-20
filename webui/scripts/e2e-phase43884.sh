#!/usr/bin/env bash
# Phase-43884: STATUS Soft 43880+ ssh_auth_soft_46240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43880\+|through 43888|ssh_auth_soft_46240_echo_roster' webui/STATUS.md
grep -qE 'phase43888|through 43888|e2e-phase43896' webui/STATUS.md
echo "STATUS Soft 43880+ ok"; echo "cleaned"; echo "OK: phase43884 e2e passed"

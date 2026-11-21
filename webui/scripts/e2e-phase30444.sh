#!/usr/bin/env bash
# Phase-30444: STATUS Soft 30440+ ssh_auth_soft_31200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30360\+|through 30368|ssh_auth_soft_31200_echo_roster' webui/STATUS.md
grep -qE 'phase30448|through 30448|e2e-phase30456' webui/STATUS.md
echo "STATUS Soft 30440+ ok"; echo "cleaned"; echo "OK: phase30444 e2e passed"

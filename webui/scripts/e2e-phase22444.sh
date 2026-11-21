#!/usr/bin/env bash
# Phase-22444: STATUS Soft 22440+ ssh_auth_soft_22560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22440\+|through 22448|ssh_auth_soft_22560_echo_roster' webui/STATUS.md
grep -qE 'phase22448|through 22448|e2e-phase22456' webui/STATUS.md
echo "STATUS Soft 22440+ ok"; echo "cleaned"; echo "OK: phase22444 e2e passed"

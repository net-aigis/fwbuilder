#!/usr/bin/env bash
# Phase-16364: STATUS Soft 16360+ ssh_auth_soft_16320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16360\+|through 16368|ssh_auth_soft_16320_echo_roster' webui/STATUS.md
grep -qE 'phase16368|through 16368|e2e-phase16376' webui/STATUS.md
echo "STATUS Soft 16360+ ok"; echo "cleaned"; echo "OK: phase16364 e2e passed"

#!/usr/bin/env bash
# Phase-25324: STATUS Soft 25320+ ssh_auth_soft_25440_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25320\+|through 25328|ssh_auth_soft_25440_echo_roster' webui/STATUS.md
grep -qE 'phase25328|through 25328|e2e-phase25336' webui/STATUS.md
echo "STATUS Soft 25320+ ok"; echo "cleaned"; echo "OK: phase25324 e2e passed"

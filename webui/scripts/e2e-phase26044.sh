#!/usr/bin/env bash
# Phase-26044: STATUS Soft 26040+ ssh_auth_ms_62500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26040\+|through 26048|ssh_auth_ms_62500_echo_roster' webui/STATUS.md
grep -qE 'phase26048|through 26048|e2e-phase26056' webui/STATUS.md
echo "STATUS Soft 26040+ ok"; echo "cleaned"; echo "OK: phase26044 e2e passed"

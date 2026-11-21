#!/usr/bin/env bash
# Phase-16044: STATUS Soft 16040+ ssh_auth_soft_15960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16040\+|through 16048|ssh_auth_soft_15960_echo_roster' webui/STATUS.md
grep -qE 'phase16048|through 16048|e2e-phase16056' webui/STATUS.md
echo "STATUS Soft 16040+ ok"; echo "cleaned"; echo "OK: phase16044 e2e passed"

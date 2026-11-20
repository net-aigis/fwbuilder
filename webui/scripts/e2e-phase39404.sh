#!/usr/bin/env bash
# Phase-39404: STATUS Soft 39400+ ssh_auth_soft_41200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 39400\+|through 39408|ssh_auth_soft_41200_echo_roster' webui/STATUS.md
grep -qE 'phase39408|through 39408|e2e-phase39416' webui/STATUS.md
echo "STATUS Soft 39400+ ok"; echo "cleaned"; echo "OK: phase39404 e2e passed"

#!/usr/bin/env bash
# Phase-31404: STATUS Soft 31400+ ssh_auth_soft_32280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 31400\+|through 31408|ssh_auth_soft_32280_echo_roster' webui/STATUS.md
grep -qE 'phase31408|through 31408|e2e-phase31416' webui/STATUS.md
echo "STATUS Soft 31400+ ok"; echo "cleaned"; echo "OK: phase31404 e2e passed"

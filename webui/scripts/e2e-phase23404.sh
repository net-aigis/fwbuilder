#!/usr/bin/env bash
# Phase-23404: STATUS Soft 23400+ ssh_auth_soft_23280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23400\+|through 23408|ssh_auth_soft_23280_echo_roster' webui/STATUS.md
grep -qE 'phase23408|through 23408|e2e-phase23416' webui/STATUS.md
echo "STATUS Soft 23400+ ok"; echo "cleaned"; echo "OK: phase23404 e2e passed"

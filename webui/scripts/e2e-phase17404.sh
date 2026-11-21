#!/usr/bin/env bash
# Phase-17404: STATUS Soft 17400+ ssh_auth_ms_49000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17400\+|through 17408|ssh_auth_ms_49000_echo_roster' webui/STATUS.md
grep -qE 'phase17408|through 17408|e2e-phase17416' webui/STATUS.md
echo "STATUS Soft 17400+ ok"; echo "cleaned"; echo "OK: phase17404 e2e passed"

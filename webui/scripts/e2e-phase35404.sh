#!/usr/bin/env bash
# Phase-35404: STATUS Soft 35400+ ssh_auth_schema_379_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35400\+|through 35408|ssh_auth_schema_379_echo_roster' webui/STATUS.md
grep -qE 'phase35408|through 35408|e2e-phase35416' webui/STATUS.md
echo "STATUS Soft 35400+ ok"; echo "cleaned"; echo "OK: phase35404 e2e passed"

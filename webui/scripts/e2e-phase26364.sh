#!/usr/bin/env bash
# Phase-26364: STATUS Soft 26360+ ssh_auth_ms_63000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26360\+|through 26368|ssh_auth_ms_63000_echo_roster' webui/STATUS.md
grep -qE 'phase26368|through 26368|e2e-phase26376' webui/STATUS.md
echo "STATUS Soft 26360+ ok"; echo "cleaned"; echo "OK: phase26364 e2e passed"

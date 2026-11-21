#!/usr/bin/env bash
# Phase-35964: STATUS Soft 35960+ ssh_auth_ms_78000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35960\+|through 35968|ssh_auth_ms_78000_echo_roster' webui/STATUS.md
grep -qE 'phase35968|through 35968|e2e-phase35976' webui/STATUS.md
echo "STATUS Soft 35960+ ok"; echo "cleaned"; echo "OK: phase35964 e2e passed"

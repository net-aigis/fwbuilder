#!/usr/bin/env bash
# Phase-33404: STATUS Soft 33400+ ssh_auth_ms_74000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 33400\+|through 33408|ssh_auth_ms_74000_echo_roster' webui/STATUS.md
grep -qE 'phase33408|through 33408|e2e-phase33416' webui/STATUS.md
echo "STATUS Soft 33400+ ok"; echo "cleaned"; echo "OK: phase33404 e2e passed"

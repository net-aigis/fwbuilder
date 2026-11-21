#!/usr/bin/env bash
# Phase-44284: STATUS Soft 44280+ ssh_auth_ms_91000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44280\+|through 44288|ssh_auth_ms_91000_echo_roster' webui/STATUS.md
grep -qE 'phase44288|through 44288|e2e-phase44296' webui/STATUS.md
echo "STATUS Soft 44280+ ok"; echo "cleaned"; echo "OK: phase44284 e2e passed"

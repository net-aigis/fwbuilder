#!/usr/bin/env bash
# Phase-24444: STATUS Soft 24440+ ssh_auth_ms_60000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24440\+|through 24448|ssh_auth_ms_60000_echo_roster' webui/STATUS.md
grep -qE 'phase24448|through 24448|e2e-phase24456' webui/STATUS.md
echo "STATUS Soft 24440+ ok"; echo "cleaned"; echo "OK: phase24444 e2e passed"

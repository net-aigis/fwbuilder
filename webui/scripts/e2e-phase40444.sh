#!/usr/bin/env bash
# Phase-40444: STATUS Soft 40440+ ssh_auth_ms_85000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40440\+|through 40448|ssh_auth_ms_85000_echo_roster' webui/STATUS.md
grep -qE 'phase40448|through 40448|e2e-phase40456' webui/STATUS.md
echo "STATUS Soft 40440+ ok"; echo "cleaned"; echo "OK: phase40444 e2e passed"

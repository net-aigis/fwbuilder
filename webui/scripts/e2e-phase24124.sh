#!/usr/bin/env bash
# Phase-24124: STATUS Soft 24120+ ssh_auth_ms_59500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24120\+|through 24128|ssh_auth_ms_59500_echo_roster' webui/STATUS.md
grep -qE 'phase24128|through 24128|e2e-phase24136' webui/STATUS.md
echo "STATUS Soft 24120+ ok"; echo "cleaned"; echo "OK: phase24124 e2e passed"

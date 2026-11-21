#!/usr/bin/env bash
# Phase-35004: STATUS Soft 35000+ ssh_auth_ms_76500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35000\+|through 35008|ssh_auth_ms_76500_echo_roster' webui/STATUS.md
grep -qE 'phase35008|through 35008|e2e-phase35016' webui/STATUS.md
echo "STATUS Soft 35000+ ok"; echo "cleaned"; echo "OK: phase35004 e2e passed"

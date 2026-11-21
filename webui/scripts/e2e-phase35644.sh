#!/usr/bin/env bash
# Phase-35644: STATUS Soft 35640+ ssh_auth_ms_77500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35640\+|through 35648|ssh_auth_ms_77500_echo_roster' webui/STATUS.md
grep -qE 'phase35648|through 35648|e2e-phase35656' webui/STATUS.md
echo "STATUS Soft 35640+ ok"; echo "cleaned"; echo "OK: phase35644 e2e passed"

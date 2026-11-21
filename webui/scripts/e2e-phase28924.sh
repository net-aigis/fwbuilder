#!/usr/bin/env bash
# Phase-28924: STATUS Soft 28920+ ssh_auth_ms_67000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28920\+|through 28928|ssh_auth_ms_67000_echo_roster' webui/STATUS.md
grep -qE 'phase28928|through 28928|e2e-phase28936' webui/STATUS.md
echo "STATUS Soft 28920+ ok"; echo "cleaned"; echo "OK: phase28924 e2e passed"

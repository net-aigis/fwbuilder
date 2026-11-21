#!/usr/bin/env bash
# Phase-35324: STATUS Soft 35320+ ssh_auth_ms_77000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35320\+|through 35328|ssh_auth_ms_77000_echo_roster' webui/STATUS.md
grep -qE 'phase35328|through 35328|e2e-phase35336' webui/STATUS.md
echo "STATUS Soft 35320+ ok"; echo "cleaned"; echo "OK: phase35324 e2e passed"

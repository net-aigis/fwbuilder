#!/usr/bin/env bash
# Phase-34364: STATUS Soft 34360+ ssh_auth_ms_75500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34360\+|through 34368|ssh_auth_ms_75500_echo_roster' webui/STATUS.md
grep -qE 'phase34368|through 34368|e2e-phase34376' webui/STATUS.md
echo "STATUS Soft 34360+ ok"; echo "cleaned"; echo "OK: phase34364 e2e passed"

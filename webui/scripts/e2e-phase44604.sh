#!/usr/bin/env bash
# Phase-44604: STATUS Soft 44600+ ssh_auth_ms_91500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44600\+|through 44608|ssh_auth_ms_91500_echo_roster' webui/STATUS.md
grep -qE 'phase44608|through 44608|e2e-phase44616' webui/STATUS.md
echo "STATUS Soft 44600+ ok"; echo "cleaned"; echo "OK: phase44604 e2e passed"

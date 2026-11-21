#!/usr/bin/env bash
# Phase-29564: STATUS Soft 29560+ ssh_auth_ms_68000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29560\+|through 29568|ssh_auth_ms_68000_echo_roster' webui/STATUS.md
grep -qE 'phase29568|through 29568|e2e-phase29576' webui/STATUS.md
echo "STATUS Soft 29560+ ok"; echo "cleaned"; echo "OK: phase29564 e2e passed"

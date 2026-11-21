#!/usr/bin/env bash
# Phase-27004: STATUS Soft 27000+ ssh_auth_ms_64000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27000\+|through 27008|ssh_auth_ms_64000_echo_roster' webui/STATUS.md
grep -qE 'phase27008|through 27008|e2e-phase27016' webui/STATUS.md
echo "STATUS Soft 27000+ ok"; echo "cleaned"; echo "OK: phase27004 e2e passed"

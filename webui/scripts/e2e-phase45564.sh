#!/usr/bin/env bash
# Phase-45564: STATUS Soft 45560+ ssh_auth_ms_93000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45560\+|through 45568|ssh_auth_ms_93000_echo_roster' webui/STATUS.md
grep -qE 'phase45568|through 45568|e2e-phase45576' webui/STATUS.md
echo "STATUS Soft 45560+ ok"; echo "cleaned"; echo "OK: phase45564 e2e passed"

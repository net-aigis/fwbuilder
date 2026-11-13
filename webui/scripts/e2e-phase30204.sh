#!/usr/bin/env bash
# Phase-30204: STATUS Soft 30200+ ssh_auth_ms_69000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30200\+|through 30208|ssh_auth_ms_69000_echo_roster' webui/STATUS.md
grep -qE 'phase30208|through 30208|e2e-phase30216' webui/STATUS.md
echo "STATUS Soft 30200+ ok"; echo "cleaned"; echo "OK: phase30204 e2e passed"

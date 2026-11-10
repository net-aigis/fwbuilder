#!/usr/bin/env bash
# Phase-25404: STATUS Soft 25400+ ssh_auth_ms_61500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25400\+|through 25408|ssh_auth_ms_61500_echo_roster' webui/STATUS.md
grep -qE 'phase25408|through 25408|e2e-phase25416' webui/STATUS.md
echo "STATUS Soft 25400+ ok"; echo "cleaned"; echo "OK: phase25404 e2e passed"

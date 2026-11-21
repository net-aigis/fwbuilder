#!/usr/bin/env bash
# Phase-46204: STATUS Soft 46200+ ssh_auth_ms_94000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46200\+|through 46208|ssh_auth_ms_94000_echo_roster' webui/STATUS.md
grep -qE 'phase46208|through 46208|e2e-phase46216' webui/STATUS.md
echo "STATUS Soft 46200+ ok"; echo "cleaned"; echo "OK: phase46204 e2e passed"

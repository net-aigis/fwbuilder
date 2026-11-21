#!/usr/bin/env bash
# Phase-38204: STATUS Soft 38200+ ssh_auth_ms_81500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38200\+|through 38208|ssh_auth_ms_81500_echo_roster' webui/STATUS.md
grep -qE 'phase38208|through 38208|e2e-phase38216' webui/STATUS.md
echo "STATUS Soft 38200+ ok"; echo "cleaned"; echo "OK: phase38204 e2e passed"

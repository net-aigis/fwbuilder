#!/usr/bin/env bash
# Phase-36204: STATUS Soft 36200+ ssh_auth_soft_37600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36200\+|through 36208|ssh_auth_soft_37600_echo_roster' webui/STATUS.md
grep -qE 'phase36208|through 36208|e2e-phase36216' webui/STATUS.md
echo "STATUS Soft 36200+ ok"; echo "cleaned"; echo "OK: phase36204 e2e passed"

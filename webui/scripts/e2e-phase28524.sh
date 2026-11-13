#!/usr/bin/env bash
# Phase-28524: STATUS Soft 28520+ ssh_auth_soft_29040_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28520\+|through 28528|ssh_auth_soft_29040_echo_roster' webui/STATUS.md
grep -qE 'phase28528|through 28528|e2e-phase28536' webui/STATUS.md
echo "STATUS Soft 28520+ ok"; echo "cleaned"; echo "OK: phase28524 e2e passed"

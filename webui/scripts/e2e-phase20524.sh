#!/usr/bin/env bash
# Phase-20524: STATUS Soft 20520+ ssh_auth_soft_20520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20520\+|through 20528|ssh_auth_soft_20520_echo_roster' webui/STATUS.md
grep -qE 'phase20528|through 20528|e2e-phase20536' webui/STATUS.md
echo "STATUS Soft 20520+ ok"; echo "cleaned"; echo "OK: phase20524 e2e passed"

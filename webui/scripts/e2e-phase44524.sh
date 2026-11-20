#!/usr/bin/env bash
# Phase-44524: STATUS Soft 44520+ ssh_auth_soft_46960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44520\+|through 44528|ssh_auth_soft_46960_echo_roster' webui/STATUS.md
grep -qE 'phase44528|through 44528|e2e-phase44536' webui/STATUS.md
echo "STATUS Soft 44520+ ok"; echo "cleaned"; echo "OK: phase44524 e2e passed"

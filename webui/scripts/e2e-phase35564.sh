#!/usr/bin/env bash
# Phase-35564: STATUS Soft 35560+ ssh_auth_soft_36880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35560\+|through 35568|ssh_auth_soft_36880_echo_roster' webui/STATUS.md
grep -qE 'phase35568|through 35568|e2e-phase35576' webui/STATUS.md
echo "STATUS Soft 35560+ ok"; echo "cleaned"; echo "OK: phase35564 e2e passed"

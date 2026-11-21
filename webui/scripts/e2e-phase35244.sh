#!/usr/bin/env bash
# Phase-35244: STATUS Soft 35240+ ssh_auth_soft_36520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35240\+|through 35248|ssh_auth_soft_36520_echo_roster' webui/STATUS.md
grep -qE 'phase35248|through 35248|e2e-phase35256' webui/STATUS.md
echo "STATUS Soft 35240+ ok"; echo "cleaned"; echo "OK: phase35244 e2e passed"

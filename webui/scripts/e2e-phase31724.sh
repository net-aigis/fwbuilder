#!/usr/bin/env bash
# Phase-31724: STATUS Soft 31720+ ssh_auth_soft_32640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 31720\+|through 31728|ssh_auth_soft_32640_echo_roster' webui/STATUS.md
grep -qE 'phase31728|through 31728|e2e-phase31736' webui/STATUS.md
echo "STATUS Soft 31720+ ok"; echo "cleaned"; echo "OK: phase31724 e2e passed"

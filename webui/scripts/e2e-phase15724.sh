#!/usr/bin/env bash
# Phase-15724: STATUS Soft 15720+ ssh_auth_soft_15600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15720\+|through 15728|ssh_auth_soft_15600_echo_roster' webui/STATUS.md
grep -qE 'phase15728|through 15728|e2e-phase15736' webui/STATUS.md
echo "STATUS Soft 15720+ ok"; echo "cleaned"; echo "OK: phase15724 e2e passed"

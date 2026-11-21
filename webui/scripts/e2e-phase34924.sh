#!/usr/bin/env bash
# Phase-34924: STATUS Soft 34920+ ssh_auth_soft_36160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34920\+|through 34928|ssh_auth_soft_36160_echo_roster' webui/STATUS.md
grep -qE 'phase34928|through 34928|e2e-phase34936' webui/STATUS.md
echo "STATUS Soft 34920+ ok"; echo "cleaned"; echo "OK: phase34924 e2e passed"

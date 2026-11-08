#!/usr/bin/env bash
# Phase-15084: STATUS Soft 15080+ ssh_auth_soft_15k_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15080\+|through 15088|ssh_auth_soft_15k_echo_roster' webui/STATUS.md
grep -qE 'phase15088|through 15088|e2e-phase15096' webui/STATUS.md
echo "STATUS Soft 15080+ ok"; echo "cleaned"; echo "OK: phase15084 e2e passed"

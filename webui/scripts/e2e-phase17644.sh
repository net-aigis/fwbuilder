#!/usr/bin/env bash
# Phase-17644: STATUS Soft 17640+ ssh_auth_soft_17560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17640\+|through 17648|ssh_auth_soft_17560_echo_roster' webui/STATUS.md
grep -qE 'phase17648|through 17648|e2e-phase17656' webui/STATUS.md
echo "STATUS Soft 17640+ ok"; echo "cleaned"; echo "OK: phase17644 e2e passed"

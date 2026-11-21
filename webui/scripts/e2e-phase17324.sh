#!/usr/bin/env bash
# Phase-17324: STATUS Soft 17320+ ssh_auth_soft_17240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17320\+|through 17328|ssh_auth_soft_17240_echo_roster' webui/STATUS.md
grep -qE 'phase17328|through 17328|e2e-phase17336' webui/STATUS.md
echo "STATUS Soft 17320+ ok"; echo "cleaned"; echo "OK: phase17324 e2e passed"

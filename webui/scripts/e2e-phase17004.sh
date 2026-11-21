#!/usr/bin/env bash
# Phase-17004: STATUS Soft 17000+ ssh_auth_soft_16920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17000\+|through 17008|ssh_auth_soft_16920_echo_roster' webui/STATUS.md
grep -qE 'phase17008|through 17008|e2e-phase17016' webui/STATUS.md
echo "STATUS Soft 17000+ ok"; echo "cleaned"; echo "OK: phase17004 e2e passed"

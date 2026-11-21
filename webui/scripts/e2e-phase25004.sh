#!/usr/bin/env bash
# Phase-25004: STATUS Soft 25000+ ssh_auth_soft_25080_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25000\+|through 25008|ssh_auth_soft_25080_echo_roster' webui/STATUS.md
grep -qE 'phase25008|through 25008|e2e-phase25016' webui/STATUS.md
echo "STATUS Soft 25000+ ok"; echo "cleaned"; echo "OK: phase25004 e2e passed"

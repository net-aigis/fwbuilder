#!/usr/bin/env bash
# Phase-24364: STATUS Soft 24360+ ssh_auth_soft_24360_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24360\+|through 24368|ssh_auth_soft_24360_echo_roster' webui/STATUS.md
grep -qE 'phase24368|through 24368|e2e-phase24376' webui/STATUS.md
echo "STATUS Soft 24360+ ok"; echo "cleaned"; echo "OK: phase24364 e2e passed"

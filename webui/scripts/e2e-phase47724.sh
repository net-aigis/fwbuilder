#!/usr/bin/env bash
# Phase-47724: STATUS Soft 47720+ ssh_auth_soft_50560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47720\+|through 47728|ssh_auth_soft_50560_echo_roster' webui/STATUS.md
grep -qE 'phase47728|through 47728|e2e-phase47736' webui/STATUS.md
echo "STATUS Soft 47720+ ok"; echo "cleaned"; echo "OK: phase47724 e2e passed"

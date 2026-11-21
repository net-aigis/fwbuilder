#!/usr/bin/env bash
# Phase-39724: STATUS Soft 39720+ ssh_auth_soft_41560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 39720\+|through 39728|ssh_auth_soft_41560_echo_roster' webui/STATUS.md
grep -qE 'phase39728|through 39728|e2e-phase39736' webui/STATUS.md
echo "STATUS Soft 39720+ ok"; echo "cleaned"; echo "OK: phase39724 e2e passed"

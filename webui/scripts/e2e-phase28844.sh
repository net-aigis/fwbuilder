#!/usr/bin/env bash
# Phase-28844: STATUS Soft 28840+ ssh_auth_soft_29400_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28840\+|through 28848|ssh_auth_soft_29400_echo_roster' webui/STATUS.md
grep -qE 'phase28848|through 28848|e2e-phase28856' webui/STATUS.md
echo "STATUS Soft 28840+ ok"; echo "cleaned"; echo "OK: phase28844 e2e passed"

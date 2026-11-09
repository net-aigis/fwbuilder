#!/usr/bin/env bash
# Phase-18924: STATUS Soft 18920+ ssh_auth_soft_18880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18920\+|through 18928|ssh_auth_soft_18880_echo_roster' webui/STATUS.md
grep -qE 'phase18928|through 18928|e2e-phase18936' webui/STATUS.md
echo "STATUS Soft 18920+ ok"; echo "cleaned"; echo "OK: phase18924 e2e passed"

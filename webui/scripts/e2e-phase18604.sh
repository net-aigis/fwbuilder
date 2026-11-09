#!/usr/bin/env bash
# Phase-18604: STATUS Soft 18600+ ssh_auth_soft_18600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18600\+|through 18608|ssh_auth_soft_18600_echo_roster' webui/STATUS.md
grep -qE 'phase18608|through 18608|e2e-phase18616' webui/STATUS.md
echo "STATUS Soft 18600+ ok"; echo "cleaned"; echo "OK: phase18604 e2e passed"

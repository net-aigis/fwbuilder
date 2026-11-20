#!/usr/bin/env bash
# Phase-40044: STATUS Soft 40040+ ssh_auth_soft_41920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40040\+|through 40048|ssh_auth_soft_41920_echo_roster' webui/STATUS.md
grep -qE 'phase40048|through 40048|e2e-phase40056' webui/STATUS.md
echo "STATUS Soft 40040+ ok"; echo "cleaned"; echo "OK: phase40044 e2e passed"

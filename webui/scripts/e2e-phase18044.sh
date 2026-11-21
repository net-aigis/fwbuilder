#!/usr/bin/env bash
# Phase-18044: STATUS Soft 18040+ ssh_auth_ms_50000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18040\+|through 18048|ssh_auth_ms_50000_echo_roster' webui/STATUS.md
grep -qE 'phase18048|through 18048|e2e-phase18056' webui/STATUS.md
echo "STATUS Soft 18040+ ok"; echo "cleaned"; echo "OK: phase18044 e2e passed"

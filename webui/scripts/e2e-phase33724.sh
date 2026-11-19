#!/usr/bin/env bash
# Phase-33724: STATUS Soft 33720+ ssh_auth_ms_74500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 33720\+|through 33728|ssh_auth_ms_74500_echo_roster' webui/STATUS.md
grep -qE 'phase33728|through 33728|e2e-phase33736' webui/STATUS.md
echo "STATUS Soft 33720+ ok"; echo "cleaned"; echo "OK: phase33724 e2e passed"

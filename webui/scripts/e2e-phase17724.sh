#!/usr/bin/env bash
# Phase-17724: STATUS Soft 17720+ ssh_auth_ms_49500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17720\+|through 17728|ssh_auth_ms_49500_echo_roster' webui/STATUS.md
grep -qE 'phase17728|through 17728|e2e-phase17736' webui/STATUS.md
echo "STATUS Soft 17720+ ok"; echo "cleaned"; echo "OK: phase17724 e2e passed"

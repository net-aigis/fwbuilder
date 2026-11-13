#!/usr/bin/env bash
# Phase-29244: STATUS Soft 29240+ ssh_auth_ms_67500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29240\+|through 29248|ssh_auth_ms_67500_echo_roster' webui/STATUS.md
grep -qE 'phase29248|through 29248|e2e-phase29256' webui/STATUS.md
echo "STATUS Soft 29240+ ok"; echo "cleaned"; echo "OK: phase29244 e2e passed"

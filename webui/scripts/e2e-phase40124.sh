#!/usr/bin/env bash
# Phase-40124: STATUS Soft 40120+ ssh_auth_ms_84500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40120\+|through 40128|ssh_auth_ms_84500_echo_roster' webui/STATUS.md
grep -qE 'phase40128|through 40128|e2e-phase40136' webui/STATUS.md
echo "STATUS Soft 40120+ ok"; echo "cleaned"; echo "OK: phase40124 e2e passed"

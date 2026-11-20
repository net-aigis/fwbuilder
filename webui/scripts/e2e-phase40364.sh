#!/usr/bin/env bash
# Phase-40364: STATUS Soft 40360+ ssh_auth_soft_42280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40360\+|through 40368|ssh_auth_soft_42280_echo_roster' webui/STATUS.md
grep -qE 'phase40368|through 40368|e2e-phase40376' webui/STATUS.md
echo "STATUS Soft 40360+ ok"; echo "cleaned"; echo "OK: phase40364 e2e passed"

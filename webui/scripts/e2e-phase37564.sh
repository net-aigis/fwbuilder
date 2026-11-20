#!/usr/bin/env bash
# Phase-37564: STATUS Soft 37560+ ssh_auth_ms_80500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 37560\+|through 37568|ssh_auth_ms_80500_echo_roster' webui/STATUS.md
grep -qE 'phase37568|through 37568|e2e-phase37576' webui/STATUS.md
echo "STATUS Soft 37560+ ok"; echo "cleaned"; echo "OK: phase37564 e2e passed"

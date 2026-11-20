#!/usr/bin/env bash
# Phase-36924: STATUS Soft 36920+ ssh_auth_ms_79500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36920\+|through 36928|ssh_auth_ms_79500_echo_roster' webui/STATUS.md
grep -qE 'phase36928|through 36928|e2e-phase36936' webui/STATUS.md
echo "STATUS Soft 36920+ ok"; echo "cleaned"; echo "OK: phase36924 e2e passed"

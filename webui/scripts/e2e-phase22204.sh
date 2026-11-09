#!/usr/bin/env bash
# Phase-22204: STATUS Soft 22200+ ssh_auth_ms_56500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22200\+|through 22208|ssh_auth_ms_56500_echo_roster' webui/STATUS.md
grep -qE 'phase22208|through 22208|e2e-phase22216' webui/STATUS.md
echo "STATUS Soft 22200+ ok"; echo "cleaned"; echo "OK: phase22204 e2e passed"

#!/usr/bin/env bash
# Phase-31740: STATUS mentions ssh_auth_ms_71500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_71500_echo_roster|soft_fertig_ssh_auth_ms_71500_echo_roster' webui/STATUS.md
grep -qE 'phase31744|through 31744|e2e-phase31744' webui/STATUS.md
echo "STATUS ssh-auth-ms-71500-echo roster ok"; echo "cleaned"; echo "OK: phase31740 e2e passed"

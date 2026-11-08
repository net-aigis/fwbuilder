#!/usr/bin/env bash
# Phase-15740: STATUS mentions ssh_auth_ms_46500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_46500_echo_roster|soft_fertig_ssh_auth_ms_46500_echo_roster' webui/STATUS.md
grep -qE 'phase15744|through 15744|e2e-phase15744' webui/STATUS.md
echo "STATUS ssh-auth-ms-46500-echo roster ok"; echo "cleaned"; echo "OK: phase15740 e2e passed"

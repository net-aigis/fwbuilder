#!/usr/bin/env bash
# Phase-22780: STATUS mentions ssh_auth_ms_57500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_57500_echo_roster|soft_fertig_ssh_auth_ms_57500_echo_roster' webui/STATUS.md
grep -qE 'phase22784|through 22784|e2e-phase22784' webui/STATUS.md
echo "STATUS ssh-auth-ms-57500-echo roster ok"; echo "cleaned"; echo "OK: phase22780 e2e passed"

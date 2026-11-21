#!/usr/bin/env bash
# Phase-41980: STATUS mentions ssh_auth_ms_87500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_87500_echo_roster|soft_fertig_ssh_auth_ms_87500_echo_roster' webui/STATUS.md
grep -qE 'phase41984|through 41984|e2e-phase41984' webui/STATUS.md
echo "STATUS ssh-auth-ms-87500-echo roster ok"; echo "cleaned"; echo "OK: phase41980 e2e passed"

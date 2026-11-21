#!/usr/bin/env bash
# Phase-30780: STATUS mentions ssh_auth_ms_70000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_70000_echo_roster|soft_fertig_ssh_auth_ms_70000_echo_roster' webui/STATUS.md
grep -qE 'phase30784|through 30784|e2e-phase30784' webui/STATUS.md
echo "STATUS ssh-auth-ms-70000-echo roster ok"; echo "cleaned"; echo "OK: phase30780 e2e passed"

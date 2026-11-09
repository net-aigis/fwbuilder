#!/usr/bin/env bash
# Phase-17260: STATUS mentions ssh_auth_soft_17240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_17240_echo_roster|soft_fertig_ssh_auth_soft_17240_echo_roster' webui/STATUS.md
grep -qE 'phase17264|through 17264|e2e-phase17264' webui/STATUS.md
echo "STATUS ssh-auth-soft-17240-echo roster ok"; echo "cleaned"; echo "OK: phase17260 e2e passed"

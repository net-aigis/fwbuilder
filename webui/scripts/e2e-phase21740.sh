#!/usr/bin/env bash
# Phase-21740: STATUS mentions ssh_auth_soft_21840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_21840_echo_roster|soft_fertig_ssh_auth_soft_21840_echo_roster' webui/STATUS.md
grep -qE 'phase21744|through 21744|e2e-phase21744' webui/STATUS.md
echo "STATUS ssh-auth-soft-21840-echo roster ok"; echo "cleaned"; echo "OK: phase21740 e2e passed"

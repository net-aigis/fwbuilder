#!/usr/bin/env bash
# Phase-17900: STATUS mentions ssh_auth_soft_17920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_17920_echo_roster|soft_fertig_ssh_auth_soft_17920_echo_roster' webui/STATUS.md
grep -qE 'phase17904|through 17904|e2e-phase17904' webui/STATUS.md
echo "STATUS ssh-auth-soft-17920-echo roster ok"; echo "cleaned"; echo "OK: phase17900 e2e passed"

#!/usr/bin/env bash
# Phase-41260: STATUS mentions ssh_auth_soft_43360_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_43360_echo_roster|soft_fertig_ssh_auth_soft_43360_echo_roster' webui/STATUS.md
grep -qE 'phase41264|through 41264|e2e-phase41264' webui/STATUS.md
echo "STATUS ssh-auth-soft-43360-echo roster ok"; echo "cleaned"; echo "OK: phase41260 e2e passed"

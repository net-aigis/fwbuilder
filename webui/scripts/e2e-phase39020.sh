#!/usr/bin/env bash
# Phase-39020: STATUS mentions ssh_auth_soft_40840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_40840_echo_roster|soft_fertig_ssh_auth_soft_40840_echo_roster' webui/STATUS.md
grep -qE 'phase39024|through 39024|e2e-phase39024' webui/STATUS.md
echo "STATUS ssh-auth-soft-40840-echo roster ok"; echo "cleaned"; echo "OK: phase39020 e2e passed"

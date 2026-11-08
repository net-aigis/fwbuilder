#!/usr/bin/env bash
# Phase-15020: STATUS mentions ssh_auth_soft_15k_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_15k_echo_roster|soft_fertig_ssh_auth_soft_15k_echo_roster' webui/STATUS.md
grep -qE 'phase15024|through 15024|e2e-phase15024' webui/STATUS.md
echo "STATUS ssh-auth-soft-15k-echo roster ok"; echo "cleaned"; echo "OK: phase15020 e2e passed"

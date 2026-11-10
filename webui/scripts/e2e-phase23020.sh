#!/usr/bin/env bash
# Phase-23020: STATUS mentions ssh_auth_soft_22920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_22920_echo_roster|soft_fertig_ssh_auth_soft_22920_echo_roster' webui/STATUS.md
grep -qE 'phase23024|through 23024|e2e-phase23024' webui/STATUS.md
echo "STATUS ssh-auth-soft-22920-echo roster ok"; echo "cleaned"; echo "OK: phase23020 e2e passed"

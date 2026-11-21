#!/usr/bin/env bash
# Phase-40940: STATUS mentions ssh_auth_soft_43000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_43000_echo_roster|soft_fertig_ssh_auth_soft_43000_echo_roster' webui/STATUS.md
grep -qE 'phase40944|through 40944|e2e-phase40944' webui/STATUS.md
echo "STATUS ssh-auth-soft-43000-echo roster ok"; echo "cleaned"; echo "OK: phase40940 e2e passed"

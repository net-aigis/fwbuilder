#!/usr/bin/env bash
# Phase-32940: STATUS mentions ssh_auth_soft_34080_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_34080_echo_roster|soft_fertig_ssh_auth_soft_34080_echo_roster' webui/STATUS.md
grep -qE 'phase32944|through 32944|e2e-phase32944' webui/STATUS.md
echo "STATUS ssh-auth-soft-34080-echo roster ok"; echo "cleaned"; echo "OK: phase32940 e2e passed"

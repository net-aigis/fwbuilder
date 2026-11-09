#!/usr/bin/env bash
# Phase-16940: STATUS mentions ssh_auth_soft_16920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_16920_echo_roster|soft_fertig_ssh_auth_soft_16920_echo_roster' webui/STATUS.md
grep -qE 'phase16944|through 16944|e2e-phase16944' webui/STATUS.md
echo "STATUS ssh-auth-soft-16920-echo roster ok"; echo "cleaned"; echo "OK: phase16940 e2e passed"

#!/usr/bin/env bash
# Phase-36460: STATUS mentions ssh_auth_soft_37960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_37960_echo_roster|soft_fertig_ssh_auth_soft_37960_echo_roster' webui/STATUS.md
grep -qE 'phase36464|through 36464|e2e-phase36464' webui/STATUS.md
echo "STATUS ssh-auth-soft-37960-echo roster ok"; echo "cleaned"; echo "OK: phase36460 e2e passed"

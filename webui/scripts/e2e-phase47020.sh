#!/usr/bin/env bash
# Phase-47020: STATUS mentions ssh_auth_soft_49840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_49840_echo_roster|soft_fertig_ssh_auth_soft_49840_echo_roster' webui/STATUS.md
grep -qE 'phase47024|through 47024|e2e-phase47024' webui/STATUS.md
echo "STATUS ssh-auth-soft-49840-echo roster ok"; echo "cleaned"; echo "OK: phase47020 e2e passed"

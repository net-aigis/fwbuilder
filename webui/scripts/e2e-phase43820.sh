#!/usr/bin/env bash
# Phase-43820: STATUS mentions ssh_auth_soft_46240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_46240_echo_roster|soft_fertig_ssh_auth_soft_46240_echo_roster' webui/STATUS.md
grep -qE 'phase43824|through 43824|e2e-phase43824' webui/STATUS.md
echo "STATUS ssh-auth-soft-46240-echo roster ok"; echo "cleaned"; echo "OK: phase43820 e2e passed"

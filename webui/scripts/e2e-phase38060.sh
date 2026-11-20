#!/usr/bin/env bash
# Phase-38060: STATUS mentions ssh_auth_soft_39760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_39760_echo_roster|soft_fertig_ssh_auth_soft_39760_echo_roster' webui/STATUS.md
grep -qE 'phase38064|through 38064|e2e-phase38064' webui/STATUS.md
echo "STATUS ssh-auth-soft-39760-echo roster ok"; echo "cleaned"; echo "OK: phase38060 e2e passed"

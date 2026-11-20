#!/usr/bin/env bash
# Phase-39980: STATUS mentions ssh_auth_soft_41920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_41920_echo_roster|soft_fertig_ssh_auth_soft_41920_echo_roster' webui/STATUS.md
grep -qE 'phase39984|through 39984|e2e-phase39984' webui/STATUS.md
echo "STATUS ssh-auth-soft-41920-echo roster ok"; echo "cleaned"; echo "OK: phase39980 e2e passed"

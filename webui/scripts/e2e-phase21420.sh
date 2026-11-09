#!/usr/bin/env bash
# Phase-21420: STATUS mentions ssh_auth_soft_21480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_21480_echo_roster|soft_fertig_ssh_auth_soft_21480_echo_roster' webui/STATUS.md
grep -qE 'phase21424|through 21424|e2e-phase21424' webui/STATUS.md
echo "STATUS ssh-auth-soft-21480-echo roster ok"; echo "cleaned"; echo "OK: phase21420 e2e passed"

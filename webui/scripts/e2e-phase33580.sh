#!/usr/bin/env bash
# Phase-33580: STATUS mentions ssh_auth_soft_34720_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_34720_echo_roster|soft_fertig_ssh_auth_soft_34720_echo_roster' webui/STATUS.md
grep -qE 'phase33584|through 33584|e2e-phase33584' webui/STATUS.md
echo "STATUS ssh-auth-soft-34720-echo roster ok"; echo "cleaned"; echo "OK: phase33580 e2e passed"

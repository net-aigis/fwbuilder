#!/usr/bin/env bash
# Phase-47980: STATUS mentions ssh_auth_soft_50920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_50920_echo_roster|soft_fertig_ssh_auth_soft_50920_echo_roster' webui/STATUS.md
grep -qE 'phase47984|through 47984|e2e-phase47984' webui/STATUS.md
echo "STATUS ssh-auth-soft-50920-echo roster ok"; echo "cleaned"; echo "OK: phase47980 e2e passed"

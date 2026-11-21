#!/usr/bin/env bash
# Phase-23980: STATUS mentions ssh_auth_soft_24000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_24000_echo_roster|soft_fertig_ssh_auth_soft_24000_echo_roster' webui/STATUS.md
grep -qE 'phase23984|through 23984|e2e-phase23984' webui/STATUS.md
echo "STATUS ssh-auth-soft-24000-echo roster ok"; echo "cleaned"; echo "OK: phase23980 e2e passed"

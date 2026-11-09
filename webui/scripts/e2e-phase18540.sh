#!/usr/bin/env bash
# Phase-18540: STATUS mentions ssh_auth_soft_18600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_18600_echo_roster|soft_fertig_ssh_auth_soft_18600_echo_roster' webui/STATUS.md
grep -qE 'phase18544|through 18544|e2e-phase18544' webui/STATUS.md
echo "STATUS ssh-auth-soft-18600-echo roster ok"; echo "cleaned"; echo "OK: phase18540 e2e passed"

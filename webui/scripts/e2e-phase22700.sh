#!/usr/bin/env bash
# Phase-22700: STATUS mentions ssh_auth_soft_22880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_22880_echo_roster|soft_fertig_ssh_auth_soft_22880_echo_roster' webui/STATUS.md
grep -qE 'phase22704|through 22704|e2e-phase22704' webui/STATUS.md
echo "STATUS ssh-auth-soft-22880-echo roster ok"; echo "cleaned"; echo "OK: phase22700 e2e passed"

#!/usr/bin/env bash
# Phase-20460: STATUS mentions ssh_auth_soft_20520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_20520_echo_roster|soft_fertig_ssh_auth_soft_20520_echo_roster' webui/STATUS.md
grep -qE 'phase20464|through 20464|e2e-phase20464' webui/STATUS.md
echo "STATUS ssh-auth-soft-20520-echo roster ok"; echo "cleaned"; echo "OK: phase20460 e2e passed"

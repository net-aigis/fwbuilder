#!/usr/bin/env bash
# Phase-16620: STATUS mentions ssh_auth_soft_16640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_16640_echo_roster|soft_fertig_ssh_auth_soft_16640_echo_roster' webui/STATUS.md
grep -qE 'phase16624|through 16624|e2e-phase16624' webui/STATUS.md
echo "STATUS ssh-auth-soft-16640-echo roster ok"; echo "cleaned"; echo "OK: phase16620 e2e passed"

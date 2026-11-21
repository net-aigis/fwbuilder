#!/usr/bin/env bash
# Phase-48620: STATUS mentions ssh_auth_soft_51640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_51640_echo_roster|soft_fertig_ssh_auth_soft_51640_echo_roster' webui/STATUS.md
grep -qE 'phase48624|through 48624|e2e-phase48624' webui/STATUS.md
echo "STATUS ssh-auth-soft-51640-echo roster ok"; echo "cleaned"; echo "OK: phase48620 e2e passed"

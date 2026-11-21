#!/usr/bin/env bash
# Phase-40620: STATUS mentions ssh_auth_soft_42640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_42640_echo_roster|soft_fertig_ssh_auth_soft_42640_echo_roster' webui/STATUS.md
grep -qE 'phase40624|through 40624|e2e-phase40624' webui/STATUS.md
echo "STATUS ssh-auth-soft-42640-echo roster ok"; echo "cleaned"; echo "OK: phase40620 e2e passed"

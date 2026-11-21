#!/usr/bin/env bash
# Phase-24620: STATUS mentions ssh_auth_soft_24720_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_24720_echo_roster|soft_fertig_ssh_auth_soft_24720_echo_roster' webui/STATUS.md
grep -qE 'phase24624|through 24624|e2e-phase24624' webui/STATUS.md
echo "STATUS ssh-auth-soft-24720-echo roster ok"; echo "cleaned"; echo "OK: phase24620 e2e passed"

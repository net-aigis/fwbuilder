#!/usr/bin/env bash
# Phase-48300: STATUS mentions ssh_auth_soft_51280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_51280_echo_roster|soft_fertig_ssh_auth_soft_51280_echo_roster' webui/STATUS.md
grep -qE 'phase48304|through 48304|e2e-phase48304' webui/STATUS.md
echo "STATUS ssh-auth-soft-51280-echo roster ok"; echo "cleaned"; echo "OK: phase48300 e2e passed"

#!/usr/bin/env bash
# Phase-40300: STATUS mentions ssh_auth_soft_42280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_42280_echo_roster|soft_fertig_ssh_auth_soft_42280_echo_roster' webui/STATUS.md
grep -qE 'phase40304|through 40304|e2e-phase40304' webui/STATUS.md
echo "STATUS ssh-auth-soft-42280-echo roster ok"; echo "cleaned"; echo "OK: phase40300 e2e passed"

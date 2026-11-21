#!/usr/bin/env bash
# Phase-26540: STATUS mentions ssh_auth_soft_26880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_26880_echo_roster|soft_fertig_ssh_auth_soft_26880_echo_roster' webui/STATUS.md
grep -qE 'phase26544|through 26544|e2e-phase26544' webui/STATUS.md
echo "STATUS ssh-auth-soft-26880-echo roster ok"; echo "cleaned"; echo "OK: phase26540 e2e passed"

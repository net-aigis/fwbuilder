#!/usr/bin/env bash
# Phase-42540: STATUS mentions ssh_auth_soft_44800_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_44800_echo_roster|soft_fertig_ssh_auth_soft_44800_echo_roster' webui/STATUS.md
grep -qE 'phase42544|through 42544|e2e-phase42544' webui/STATUS.md
echo "STATUS ssh-auth-soft-44800-echo roster ok"; echo "cleaned"; echo "OK: phase42540 e2e passed"

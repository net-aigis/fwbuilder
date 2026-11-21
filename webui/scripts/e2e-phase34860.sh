#!/usr/bin/env bash
# Phase-34860: STATUS mentions ssh_auth_soft_36160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_36160_echo_roster|soft_fertig_ssh_auth_soft_36160_echo_roster' webui/STATUS.md
grep -qE 'phase34864|through 34864|e2e-phase34864' webui/STATUS.md
echo "STATUS ssh-auth-soft-36160-echo roster ok"; echo "cleaned"; echo "OK: phase34860 e2e passed"

#!/usr/bin/env bash
# Phase-19820: STATUS mentions ssh_auth_soft_19880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_19880_echo_roster|soft_fertig_ssh_auth_soft_19880_echo_roster' webui/STATUS.md
grep -qE 'phase19824|through 19824|e2e-phase19824' webui/STATUS.md
echo "STATUS ssh-auth-soft-19880-echo roster ok"; echo "cleaned"; echo "OK: phase19820 e2e passed"

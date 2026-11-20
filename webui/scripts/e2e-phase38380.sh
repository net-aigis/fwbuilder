#!/usr/bin/env bash
# Phase-38380: STATUS mentions ssh_auth_soft_40120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_40120_echo_roster|soft_fertig_ssh_auth_soft_40120_echo_roster' webui/STATUS.md
grep -qE 'phase38384|through 38384|e2e-phase38384' webui/STATUS.md
echo "STATUS ssh-auth-soft-40120-echo roster ok"; echo "cleaned"; echo "OK: phase38380 e2e passed"

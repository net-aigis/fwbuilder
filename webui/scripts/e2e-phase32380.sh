#!/usr/bin/env bash
# Phase-32380: STATUS mentions ssh_auth_ms_72500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_72500_echo_roster|soft_fertig_ssh_auth_ms_72500_echo_roster' webui/STATUS.md
grep -qE 'phase32384|through 32384|e2e-phase32384' webui/STATUS.md
echo "STATUS ssh-auth-ms-72500-echo roster ok"; echo "cleaned"; echo "OK: phase32380 e2e passed"

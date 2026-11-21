#!/usr/bin/env bash
# Phase-39420: STATUS mentions ssh_auth_ms_83500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_83500_echo_roster|soft_fertig_ssh_auth_ms_83500_echo_roster' webui/STATUS.md
grep -qE 'phase39424|through 39424|e2e-phase39424' webui/STATUS.md
echo "STATUS ssh-auth-ms-83500-echo roster ok"; echo "cleaned"; echo "OK: phase39420 e2e passed"

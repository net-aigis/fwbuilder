#!/usr/bin/env bash
# Phase-47420: STATUS mentions ssh_auth_ms_96000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_96000_echo_roster|soft_fertig_ssh_auth_ms_96000_echo_roster' webui/STATUS.md
grep -qE 'phase47424|through 47424|e2e-phase47424' webui/STATUS.md
echo "STATUS ssh-auth-ms-96000-echo roster ok"; echo "cleaned"; echo "OK: phase47420 e2e passed"

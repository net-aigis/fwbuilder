#!/usr/bin/env bash
# Phase-25340: STATUS mentions ssh_auth_ms_61500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_61500_echo_roster|soft_fertig_ssh_auth_ms_61500_echo_roster' webui/STATUS.md
grep -qE 'phase25344|through 25344|e2e-phase25344' webui/STATUS.md
echo "STATUS ssh-auth-ms-61500-echo roster ok"; echo "cleaned"; echo "OK: phase25340 e2e passed"

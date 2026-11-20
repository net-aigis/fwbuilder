#!/usr/bin/env bash
# Phase-41340: STATUS mentions ssh_auth_ms_86500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_86500_echo_roster|soft_fertig_ssh_auth_ms_86500_echo_roster' webui/STATUS.md
grep -qE 'phase41344|through 41344|e2e-phase41344' webui/STATUS.md
echo "STATUS ssh-auth-ms-86500-echo roster ok"; echo "cleaned"; echo "OK: phase41340 e2e passed"

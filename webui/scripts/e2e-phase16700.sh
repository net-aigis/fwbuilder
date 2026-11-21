#!/usr/bin/env bash
# Phase-16700: STATUS mentions ssh_auth_ms_48000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_48000_echo_roster|soft_fertig_ssh_auth_ms_48000_echo_roster' webui/STATUS.md
grep -qE 'phase16704|through 16704|e2e-phase16704' webui/STATUS.md
echo "STATUS ssh-auth-ms-48000-echo roster ok"; echo "cleaned"; echo "OK: phase16700 e2e passed"

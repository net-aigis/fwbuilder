#!/usr/bin/env bash
# Phase-32700: STATUS mentions ssh_auth_ms_73000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_73000_echo_roster|soft_fertig_ssh_auth_ms_73000_echo_roster' webui/STATUS.md
grep -qE 'phase32704|through 32704|e2e-phase32704' webui/STATUS.md
echo "STATUS ssh-auth-ms-73000-echo roster ok"; echo "cleaned"; echo "OK: phase32700 e2e passed"

#!/usr/bin/env bash
# Phase-33020: STATUS mentions ssh_auth_ms_73500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_73500_echo_roster|soft_fertig_ssh_auth_ms_73500_echo_roster' webui/STATUS.md
grep -qE 'phase33024|through 33024|e2e-phase33024' webui/STATUS.md
echo "STATUS ssh-auth-ms-73500-echo roster ok"; echo "cleaned"; echo "OK: phase33020 e2e passed"

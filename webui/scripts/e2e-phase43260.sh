#!/usr/bin/env bash
# Phase-43260: STATUS mentions ssh_auth_ms_89500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_89500_echo_roster|soft_fertig_ssh_auth_ms_89500_echo_roster' webui/STATUS.md
grep -qE 'phase43264|through 43264|e2e-phase43264' webui/STATUS.md
echo "STATUS ssh-auth-ms-89500-echo roster ok"; echo "cleaned"; echo "OK: phase43260 e2e passed"

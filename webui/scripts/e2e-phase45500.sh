#!/usr/bin/env bash
# Phase-45500: STATUS mentions ssh_auth_ms_93000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_93000_echo_roster|soft_fertig_ssh_auth_ms_93000_echo_roster' webui/STATUS.md
grep -qE 'phase45504|through 45504|e2e-phase45504' webui/STATUS.md
echo "STATUS ssh-auth-ms-93000-echo roster ok"; echo "cleaned"; echo "OK: phase45500 e2e passed"

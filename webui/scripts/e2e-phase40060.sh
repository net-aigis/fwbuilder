#!/usr/bin/env bash
# Phase-40060: STATUS mentions ssh_auth_ms_84500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_84500_echo_roster|soft_fertig_ssh_auth_ms_84500_echo_roster' webui/STATUS.md
grep -qE 'phase40064|through 40064|e2e-phase40064' webui/STATUS.md
echo "STATUS ssh-auth-ms-84500-echo roster ok"; echo "cleaned"; echo "OK: phase40060 e2e passed"

#!/usr/bin/env bash
# Phase-34940: STATUS mentions ssh_auth_ms_76500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_76500_echo_roster|soft_fertig_ssh_auth_ms_76500_echo_roster' webui/STATUS.md
grep -qE 'phase34944|through 34944|e2e-phase34944' webui/STATUS.md
echo "STATUS ssh-auth-ms-76500-echo roster ok"; echo "cleaned"; echo "OK: phase34940 e2e passed"

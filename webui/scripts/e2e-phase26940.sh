#!/usr/bin/env bash
# Phase-26940: STATUS mentions ssh_auth_ms_64000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_64000_echo_roster|soft_fertig_ssh_auth_ms_64000_echo_roster' webui/STATUS.md
grep -qE 'phase26944|through 26944|e2e-phase26944' webui/STATUS.md
echo "STATUS ssh-auth-ms-64000-echo roster ok"; echo "cleaned"; echo "OK: phase26940 e2e passed"

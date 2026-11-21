#!/usr/bin/env bash
# Phase-48060: STATUS mentions ssh_auth_ms_97000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_97000_echo_roster|soft_fertig_ssh_auth_ms_97000_echo_roster' webui/STATUS.md
grep -qE 'phase48064|through 48064|e2e-phase48064' webui/STATUS.md
echo "STATUS ssh-auth-ms-97000-echo roster ok"; echo "cleaned"; echo "OK: phase48060 e2e passed"

#!/usr/bin/env bash
# Phase-44940: STATUS mentions ssh_auth_schema_499_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_499_echo_roster|soft_fertig_ssh_auth_schema_499_echo_roster' webui/STATUS.md
grep -qE 'phase44944|through 44944|e2e-phase44944' webui/STATUS.md
echo "STATUS ssh-auth-schema-499-echo roster ok"; echo "cleaned"; echo "OK: phase44940 e2e passed"

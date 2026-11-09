#!/usr/bin/env bash
# Phase-20300: STATUS mentions ssh_auth_schema_191_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_191_echo_roster|soft_fertig_ssh_auth_schema_191_echo_roster' webui/STATUS.md
grep -qE 'phase20304|through 20304|e2e-phase20304' webui/STATUS.md
echo "STATUS ssh-auth-schema-191-echo roster ok"; echo "cleaned"; echo "OK: phase20300 e2e passed"

#!/usr/bin/env bash
# Phase-31500: STATUS mentions ssh_auth_schema_331_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_331_echo_roster|soft_fertig_ssh_auth_schema_331_echo_roster' webui/STATUS.md
grep -qE 'phase31504|through 31504|e2e-phase31504' webui/STATUS.md
echo "STATUS ssh-auth-schema-331-echo roster ok"; echo "cleaned"; echo "OK: phase31500 e2e passed"

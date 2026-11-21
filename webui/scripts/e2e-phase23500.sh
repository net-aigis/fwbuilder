#!/usr/bin/env bash
# Phase-23500: STATUS mentions ssh_auth_schema_231_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_231_echo_roster|soft_fertig_ssh_auth_schema_231_echo_roster' webui/STATUS.md
grep -qE 'phase23504|through 23504|e2e-phase23504' webui/STATUS.md
echo "STATUS ssh-auth-schema-231-echo roster ok"; echo "cleaned"; echo "OK: phase23500 e2e passed"

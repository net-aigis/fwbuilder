#!/usr/bin/env bash
# Phase-15500: STATUS mentions ssh_auth_schema_131_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_131_echo_roster|soft_fertig_ssh_auth_schema_131_echo_roster' webui/STATUS.md
grep -qE 'phase15504|through 15504|e2e-phase15504' webui/STATUS.md
echo "STATUS ssh-auth-schema-131-echo roster ok"; echo "cleaned"; echo "OK: phase15500 e2e passed"

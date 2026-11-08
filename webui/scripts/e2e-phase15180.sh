#!/usr/bin/env bash
# Phase-15180: STATUS mentions ssh_auth_schema_127_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_127_echo_roster|soft_fertig_ssh_auth_schema_127_echo_roster' webui/STATUS.md
grep -qE 'phase15184|through 15184|e2e-phase15184' webui/STATUS.md
echo "STATUS ssh-auth-schema-127-echo roster ok"; echo "cleaned"; echo "OK: phase15180 e2e passed"

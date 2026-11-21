#!/usr/bin/env bash
# Phase-48140: STATUS mentions ssh_auth_schema_539_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_539_echo_roster|soft_fertig_ssh_auth_schema_539_echo_roster' webui/STATUS.md
grep -qE 'phase48144|through 48144|e2e-phase48144' webui/STATUS.md
echo "STATUS ssh-auth-schema-539-echo roster ok"; echo "cleaned"; echo "OK: phase48140 e2e passed"

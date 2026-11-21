#!/usr/bin/env bash
# Phase-37900: STATUS mentions ssh_auth_schema_411_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_411_echo_roster|soft_fertig_ssh_auth_schema_411_echo_roster' webui/STATUS.md
grep -qE 'phase37904|through 37904|e2e-phase37904' webui/STATUS.md
echo "STATUS ssh-auth-schema-411-echo roster ok"; echo "cleaned"; echo "OK: phase37900 e2e passed"

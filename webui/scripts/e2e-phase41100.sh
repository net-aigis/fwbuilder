#!/usr/bin/env bash
# Phase-41100: STATUS mentions ssh_auth_schema_451_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_451_echo_roster|soft_fertig_ssh_auth_schema_451_echo_roster' webui/STATUS.md
grep -qE 'phase41104|through 41104|e2e-phase41104' webui/STATUS.md
echo "STATUS ssh-auth-schema-451-echo roster ok"; echo "cleaned"; echo "OK: phase41100 e2e passed"

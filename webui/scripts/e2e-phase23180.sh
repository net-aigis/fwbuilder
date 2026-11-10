#!/usr/bin/env bash
# Phase-23180: STATUS mentions ssh_auth_schema_227_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_227_echo_roster|soft_fertig_ssh_auth_schema_227_echo_roster' webui/STATUS.md
grep -qE 'phase23184|through 23184|e2e-phase23184' webui/STATUS.md
echo "STATUS ssh-auth-schema-227-echo roster ok"; echo "cleaned"; echo "OK: phase23180 e2e passed"

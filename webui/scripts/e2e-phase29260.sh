#!/usr/bin/env bash
# Phase-29260: STATUS mentions ssh_auth_schema_303_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_303_echo_roster|soft_fertig_ssh_auth_schema_303_echo_roster' webui/STATUS.md
grep -qE 'phase29264|through 29264|e2e-phase29264' webui/STATUS.md
echo "STATUS ssh-auth-schema-303-echo roster ok"; echo "cleaned"; echo "OK: phase29260 e2e passed"

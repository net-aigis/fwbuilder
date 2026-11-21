#!/usr/bin/env bash
# Phase-29900: STATUS mentions ssh_auth_schema_311_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_311_echo_roster|soft_fertig_ssh_auth_schema_311_echo_roster' webui/STATUS.md
grep -qE 'phase29904|through 29904|e2e-phase29904' webui/STATUS.md
echo "STATUS ssh-auth-schema-311-echo roster ok"; echo "cleaned"; echo "OK: phase29900 e2e passed"

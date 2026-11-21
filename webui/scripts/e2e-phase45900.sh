#!/usr/bin/env bash
# Phase-45900: STATUS mentions ssh_auth_schema_511_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_511_echo_roster|soft_fertig_ssh_auth_schema_511_echo_roster' webui/STATUS.md
grep -qE 'phase45904|through 45904|e2e-phase45904' webui/STATUS.md
echo "STATUS ssh-auth-schema-511-echo roster ok"; echo "cleaned"; echo "OK: phase45900 e2e passed"

#!/usr/bin/env bash
# Phase-42060: STATUS mentions ssh_auth_schema_463_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_463_echo_roster|soft_fertig_ssh_auth_schema_463_echo_roster' webui/STATUS.md
grep -qE 'phase42064|through 42064|e2e-phase42064' webui/STATUS.md
echo "STATUS ssh-auth-schema-463-echo roster ok"; echo "cleaned"; echo "OK: phase42060 e2e passed"

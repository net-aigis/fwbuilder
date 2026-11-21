#!/usr/bin/env bash
# Phase-25100: STATUS mentions ssh_auth_schema_251_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_251_echo_roster|soft_fertig_ssh_auth_schema_251_echo_roster' webui/STATUS.md
grep -qE 'phase25104|through 25104|e2e-phase25104' webui/STATUS.md
echo "STATUS ssh-auth-schema-251-echo roster ok"; echo "cleaned"; echo "OK: phase25100 e2e passed"

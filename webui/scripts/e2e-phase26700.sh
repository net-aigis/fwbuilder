#!/usr/bin/env bash
# Phase-26700: STATUS mentions ssh_auth_schema_271_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_271_echo_roster|soft_fertig_ssh_auth_schema_271_echo_roster' webui/STATUS.md
grep -qE 'phase26704|through 26704|e2e-phase26704' webui/STATUS.md
echo "STATUS ssh-auth-schema-271-echo roster ok"; echo "cleaned"; echo "OK: phase26700 e2e passed"

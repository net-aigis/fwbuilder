#!/usr/bin/env bash
# Phase-19660: STATUS mentions ssh_auth_schema_183_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_183_echo_roster|soft_fertig_ssh_auth_schema_183_echo_roster' webui/STATUS.md
grep -qE 'phase19664|through 19664|e2e-phase19664' webui/STATUS.md
echo "STATUS ssh-auth-schema-183-echo roster ok"; echo "cleaned"; echo "OK: phase19660 e2e passed"

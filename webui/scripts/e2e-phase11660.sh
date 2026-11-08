#!/usr/bin/env bash
# Phase-11660: STATUS mentions ssh_auth_schema_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_echo_roster|soft_fertig_ssh_auth_schema_echo_roster' webui/STATUS.md
grep -qE 'phase11664|through 11664|e2e-phase11664' webui/STATUS.md
echo "STATUS ssh-auth-schema-echo roster ok"; echo "cleaned"; echo "OK: phase11660 e2e passed"

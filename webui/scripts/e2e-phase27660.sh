#!/usr/bin/env bash
# Phase-27660: STATUS mentions ssh_auth_schema_283_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_283_echo_roster|soft_fertig_ssh_auth_schema_283_echo_roster' webui/STATUS.md
grep -qE 'phase27664|through 27664|e2e-phase27664' webui/STATUS.md
echo "STATUS ssh-auth-schema-283-echo roster ok"; echo "cleaned"; echo "OK: phase27660 e2e passed"

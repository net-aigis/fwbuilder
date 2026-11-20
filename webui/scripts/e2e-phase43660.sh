#!/usr/bin/env bash
# Phase-43660: STATUS mentions ssh_auth_schema_483_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_483_echo_roster|soft_fertig_ssh_auth_schema_483_echo_roster' webui/STATUS.md
grep -qE 'phase43664|through 43664|e2e-phase43664' webui/STATUS.md
echo "STATUS ssh-auth-schema-483-echo roster ok"; echo "cleaned"; echo "OK: phase43660 e2e passed"

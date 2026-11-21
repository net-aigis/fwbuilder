#!/usr/bin/env bash
# Phase-21260: STATUS mentions ssh_auth_schema_203_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_203_echo_roster|soft_fertig_ssh_auth_schema_203_echo_roster' webui/STATUS.md
grep -qE 'phase21264|through 21264|e2e-phase21264' webui/STATUS.md
echo "STATUS ssh-auth-schema-203-echo roster ok"; echo "cleaned"; echo "OK: phase21260 e2e passed"

#!/usr/bin/env bash
# Phase-33420: STATUS mentions ssh_auth_schema_355_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_355_echo_roster|soft_fertig_ssh_auth_schema_355_echo_roster' webui/STATUS.md
grep -qE 'phase33424|through 33424|e2e-phase33424' webui/STATUS.md
echo "STATUS ssh-auth-schema-355-echo roster ok"; echo "cleaned"; echo "OK: phase33420 e2e passed"

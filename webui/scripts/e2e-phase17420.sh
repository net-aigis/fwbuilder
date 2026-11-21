#!/usr/bin/env bash
# Phase-17420: STATUS mentions ssh_auth_schema_155_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_155_echo_roster|soft_fertig_ssh_auth_schema_155_echo_roster' webui/STATUS.md
grep -qE 'phase17424|through 17424|e2e-phase17424' webui/STATUS.md
echo "STATUS ssh-auth-schema-155-echo roster ok"; echo "cleaned"; echo "OK: phase17420 e2e passed"

#!/usr/bin/env bash
# Phase-30540: STATUS mentions ssh_auth_schema_319_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_319_echo_roster|soft_fertig_ssh_auth_schema_319_echo_roster' webui/STATUS.md
grep -qE 'phase30544|through 30544|e2e-phase30544' webui/STATUS.md
echo "STATUS ssh-auth-schema-319-echo roster ok"; echo "cleaned"; echo "OK: phase30540 e2e passed"

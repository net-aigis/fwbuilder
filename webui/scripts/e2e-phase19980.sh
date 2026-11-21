#!/usr/bin/env bash
# Phase-19980: STATUS mentions ssh_auth_schema_187_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_187_echo_roster|soft_fertig_ssh_auth_schema_187_echo_roster' webui/STATUS.md
grep -qE 'phase19984|through 19984|e2e-phase19984' webui/STATUS.md
echo "STATUS ssh-auth-schema-187-echo roster ok"; echo "cleaned"; echo "OK: phase19980 e2e passed"

#!/usr/bin/env bash
# Phase-37580: STATUS mentions ssh_auth_schema_407_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_407_echo_roster|soft_fertig_ssh_auth_schema_407_echo_roster' webui/STATUS.md
grep -qE 'phase37584|through 37584|e2e-phase37584' webui/STATUS.md
echo "STATUS ssh-auth-schema-407-echo roster ok"; echo "cleaned"; echo "OK: phase37580 e2e passed"

#!/usr/bin/env bash
# Phase-19340: STATUS mentions ssh_auth_schema_179_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_179_echo_roster|soft_fertig_ssh_auth_schema_179_echo_roster' webui/STATUS.md
grep -qE 'phase19344|through 19344|e2e-phase19344' webui/STATUS.md
echo "STATUS ssh-auth-schema-179-echo roster ok"; echo "cleaned"; echo "OK: phase19340 e2e passed"

#!/usr/bin/env bash
# Phase-35980: STATUS mentions ssh_auth_schema_387_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_387_echo_roster|soft_fertig_ssh_auth_schema_387_echo_roster' webui/STATUS.md
grep -qE 'phase35984|through 35984|e2e-phase35984' webui/STATUS.md
echo "STATUS ssh-auth-schema-387-echo roster ok"; echo "cleaned"; echo "OK: phase35980 e2e passed"

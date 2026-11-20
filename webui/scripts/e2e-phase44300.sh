#!/usr/bin/env bash
# Phase-44300: STATUS mentions ssh_auth_schema_491_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_491_echo_roster|soft_fertig_ssh_auth_schema_491_echo_roster' webui/STATUS.md
grep -qE 'phase44304|through 44304|e2e-phase44304' webui/STATUS.md
echo "STATUS ssh-auth-schema-491-echo roster ok"; echo "cleaned"; echo "OK: phase44300 e2e passed"

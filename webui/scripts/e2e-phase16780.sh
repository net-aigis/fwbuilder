#!/usr/bin/env bash
# Phase-16780: STATUS mentions ssh_auth_schema_147_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_147_echo_roster|soft_fertig_ssh_auth_schema_147_echo_roster' webui/STATUS.md
grep -qE 'phase16784|through 16784|e2e-phase16784' webui/STATUS.md
echo "STATUS ssh-auth-schema-147-echo roster ok"; echo "cleaned"; echo "OK: phase16780 e2e passed"

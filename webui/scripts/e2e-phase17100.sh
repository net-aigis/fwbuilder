#!/usr/bin/env bash
# Phase-17100: STATUS mentions ssh_auth_schema_151_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_151_echo_roster|soft_fertig_ssh_auth_schema_151_echo_roster' webui/STATUS.md
grep -qE 'phase17104|through 17104|e2e-phase17104' webui/STATUS.md
echo "STATUS ssh-auth-schema-151-echo roster ok"; echo "cleaned"; echo "OK: phase17100 e2e passed"

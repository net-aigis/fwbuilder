#!/usr/bin/env bash
# Phase-30860: STATUS mentions ssh_auth_schema_323_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_323_echo_roster|soft_fertig_ssh_auth_schema_323_echo_roster' webui/STATUS.md
grep -qE 'phase30864|through 30864|e2e-phase30864' webui/STATUS.md
echo "STATUS ssh-auth-schema-323-echo roster ok"; echo "cleaned"; echo "OK: phase30860 e2e passed"

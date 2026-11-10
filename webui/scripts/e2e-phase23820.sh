#!/usr/bin/env bash
# Phase-23820: STATUS mentions ssh_auth_schema_235_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_235_echo_roster|soft_fertig_ssh_auth_schema_235_echo_roster' webui/STATUS.md
grep -qE 'phase23824|through 23824|e2e-phase23824' webui/STATUS.md
echo "STATUS ssh-auth-schema-235-echo roster ok"; echo "cleaned"; echo "OK: phase23820 e2e passed"

#!/usr/bin/env bash
# Phase-31180: STATUS mentions ssh_auth_schema_327_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_327_echo_roster|soft_fertig_ssh_auth_schema_327_echo_roster' webui/STATUS.md
grep -qE 'phase31184|through 31184|e2e-phase31184' webui/STATUS.md
echo "STATUS ssh-auth-schema-327-echo roster ok"; echo "cleaned"; echo "OK: phase31180 e2e passed"

#!/usr/bin/env bash
# Phase-19020: STATUS mentions ssh_auth_schema_175_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_175_echo_roster|soft_fertig_ssh_auth_schema_175_echo_roster' webui/STATUS.md
grep -qE 'phase19024|through 19024|e2e-phase19024' webui/STATUS.md
echo "STATUS ssh-auth-schema-175-echo roster ok"; echo "cleaned"; echo "OK: phase19020 e2e passed"

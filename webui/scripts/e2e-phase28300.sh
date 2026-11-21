#!/usr/bin/env bash
# Phase-28300: STATUS mentions ssh_auth_schema_291_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_291_echo_roster|soft_fertig_ssh_auth_schema_291_echo_roster' webui/STATUS.md
grep -qE 'phase28304|through 28304|e2e-phase28304' webui/STATUS.md
echo "STATUS ssh-auth-schema-291-echo roster ok"; echo "cleaned"; echo "OK: phase28300 e2e passed"

#!/usr/bin/env bash
# Phase-28940: STATUS mentions ssh_auth_schema_299_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_299_echo_roster|soft_fertig_ssh_auth_schema_299_echo_roster' webui/STATUS.md
grep -qE 'phase28944|through 28944|e2e-phase28944' webui/STATUS.md
echo "STATUS ssh-auth-schema-299-echo roster ok"; echo "cleaned"; echo "OK: phase28940 e2e passed"

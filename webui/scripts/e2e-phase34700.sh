#!/usr/bin/env bash
# Phase-34700: STATUS mentions ssh_auth_schema_371_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_371_echo_roster|soft_fertig_ssh_auth_schema_371_echo_roster' webui/STATUS.md
grep -qE 'phase34704|through 34704|e2e-phase34704' webui/STATUS.md
echo "STATUS ssh-auth-schema-371-echo roster ok"; echo "cleaned"; echo "OK: phase34700 e2e passed"

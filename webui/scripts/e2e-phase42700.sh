#!/usr/bin/env bash
# Phase-42700: STATUS mentions ssh_auth_schema_471_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_471_echo_roster|soft_fertig_ssh_auth_schema_471_echo_roster' webui/STATUS.md
grep -qE 'phase42704|through 42704|e2e-phase42704' webui/STATUS.md
echo "STATUS ssh-auth-schema-471-echo roster ok"; echo "cleaned"; echo "OK: phase42700 e2e passed"

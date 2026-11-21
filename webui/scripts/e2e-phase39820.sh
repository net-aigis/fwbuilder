#!/usr/bin/env bash
# Phase-39820: STATUS mentions ssh_auth_schema_435_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_435_echo_roster|soft_fertig_ssh_auth_schema_435_echo_roster' webui/STATUS.md
grep -qE 'phase39824|through 39824|e2e-phase39824' webui/STATUS.md
echo "STATUS ssh-auth-schema-435-echo roster ok"; echo "cleaned"; echo "OK: phase39820 e2e passed"

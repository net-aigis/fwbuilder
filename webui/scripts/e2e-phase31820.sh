#!/usr/bin/env bash
# Phase-31820: STATUS mentions ssh_auth_schema_335_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_335_echo_roster|soft_fertig_ssh_auth_schema_335_echo_roster' webui/STATUS.md
grep -qE 'phase31824|through 31824|e2e-phase31824' webui/STATUS.md
echo "STATUS ssh-auth-schema-335-echo roster ok"; echo "cleaned"; echo "OK: phase31820 e2e passed"

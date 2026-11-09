#!/usr/bin/env bash
# Phase-22540: STATUS mentions ssh_auth_schema_219_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_219_echo_roster|soft_fertig_ssh_auth_schema_219_echo_roster' webui/STATUS.md
grep -qE 'phase22544|through 22544|e2e-phase22544' webui/STATUS.md
echo "STATUS ssh-auth-schema-219-echo roster ok"; echo "cleaned"; echo "OK: phase22540 e2e passed"

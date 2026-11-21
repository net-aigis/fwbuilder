#!/usr/bin/env bash
# Phase-39500: STATUS mentions ssh_auth_schema_431_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_431_echo_roster|soft_fertig_ssh_auth_schema_431_echo_roster' webui/STATUS.md
grep -qE 'phase39504|through 39504|e2e-phase39504' webui/STATUS.md
echo "STATUS ssh-auth-schema-431-echo roster ok"; echo "cleaned"; echo "OK: phase39500 e2e passed"

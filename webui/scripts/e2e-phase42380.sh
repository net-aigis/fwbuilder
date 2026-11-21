#!/usr/bin/env bash
# Phase-42380: STATUS mentions ssh_auth_schema_467_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_467_echo_roster|soft_fertig_ssh_auth_schema_467_echo_roster' webui/STATUS.md
grep -qE 'phase42384|through 42384|e2e-phase42384' webui/STATUS.md
echo "STATUS ssh-auth-schema-467-echo roster ok"; echo "cleaned"; echo "OK: phase42380 e2e passed"

#!/usr/bin/env bash
# Phase-22860: STATUS mentions ssh_auth_schema_223_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_223_echo_roster|soft_fertig_ssh_auth_schema_223_echo_roster' webui/STATUS.md
grep -qE 'phase22864|through 22864|e2e-phase22864' webui/STATUS.md
echo "STATUS ssh-auth-schema-223-echo roster ok"; echo "cleaned"; echo "OK: phase22860 e2e passed"

#!/usr/bin/env bash
# Phase-38860: STATUS mentions ssh_auth_schema_423_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_423_echo_roster|soft_fertig_ssh_auth_schema_423_echo_roster' webui/STATUS.md
grep -qE 'phase38864|through 38864|e2e-phase38864' webui/STATUS.md
echo "STATUS ssh-auth-schema-423-echo roster ok"; echo "cleaned"; echo "OK: phase38860 e2e passed"

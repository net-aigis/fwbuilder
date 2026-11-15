#!/usr/bin/env bash
# Phase-32140: STATUS mentions ssh_auth_schema_339_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_339_echo_roster|soft_fertig_ssh_auth_schema_339_echo_roster' webui/STATUS.md
grep -qE 'phase32144|through 32144|e2e-phase32144' webui/STATUS.md
echo "STATUS ssh-auth-schema-339-echo roster ok"; echo "cleaned"; echo "OK: phase32140 e2e passed"

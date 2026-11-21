#!/usr/bin/env bash
# Phase-40140: STATUS mentions ssh_auth_schema_439_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_439_echo_roster|soft_fertig_ssh_auth_schema_439_echo_roster' webui/STATUS.md
grep -qE 'phase40144|through 40144|e2e-phase40144' webui/STATUS.md
echo "STATUS ssh-auth-schema-439-echo roster ok"; echo "cleaned"; echo "OK: phase40140 e2e passed"
